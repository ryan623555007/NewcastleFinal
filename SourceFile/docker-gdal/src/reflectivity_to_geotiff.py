#!/usr/bin/python2.7

import matplotlib
# Force matplotlib to not use any Xwindows backend.
matplotlib.use('Agg')
import numpy as np
import wradlib as wrl
import osgeo.gdal as gdal


import shutil
import glob
import os
import datetime
import multiprocessing
from PIL import Image


def array_to_raster(array,grid,raster_file):
    """Array > Raster
    Save a raster from a C order array.

    :param array: ndarray
    """

    x_pixels,y_pixels = array.shape
    PIXEL_SIZE = grid[1,0] - grid[0,0]
    print(PIXEL_SIZE)
    x_min = grid[0,0]
    y_max = grid[0,1]  # x_min & y_max are like the "top left" corner.
    wkt_projection = 'PROJCS["OSGB 1936 / British National Grid",GEOGCS["OSGB 1936",DATUM["OSGB_1936",SPHEROID["Airy 1830",6377563.396,299.3249646,AUTHORITY["EPSG","7001"]],AUTHORITY["EPSG","6277"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.01745329251994328,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4277"]],UNIT["metre",1,AUTHORITY["EPSG","9001"]],PROJECTION["Transverse_Mercator"],PARAMETER["latitude_of_origin",49],PARAMETER["central_meridian",-2],PARAMETER["scale_factor",0.9996012717],PARAMETER["false_easting",400000],PARAMETER["false_northing",-100000],AUTHORITY["EPSG","27700"],AXIS["Easting",EAST],AXIS["Northing",NORTH]]'

    driver = gdal.GetDriverByName('GTiff')

    dataset = driver.Create(
        raster_file,
        x_pixels,
        y_pixels,
        1,
        gdal.GDT_Float32, )

    dataset.SetGeoTransform((
        x_min,    # 0
        PIXEL_SIZE,  # 1
        0,                      # 2
        y_max,    # 3
        0,                      # 4
        PIXEL_SIZE))

    dataset.SetProjection(wkt_projection)
    dataset.GetRasterBand(1).WriteArray(array)
    dataset.FlushCache()  # Write to disk.
    return dataset, dataset.GetRasterBand(1)  #If you need to return, remenber to return  also the dataset because the band don`t live without dataset.

def hdf2array(filename,length):
    data = wrl.io.read_OPERA_hdf5(filename)
    numpy_data =  np.array(data['dataset1/data1/data'][:])

    dbZ = (numpy_data * data['dataset1/data1/what']['gain']) +data['dataset1/data1/what']['offset']
    dbZ[dbZ < 5] = 0

    Z = wrl.trafo.idecibel(dbZ)
    R = wrl.zr.z2r(Z, a=200., b=1.6)
    depth = wrl.trafo.r2depth(R, 600)
    depth[dbZ==0]=0

    where = data['where']

    radar_location = (where['lon'], where['lat'],where['height'])

    elevation = data['dataset1/where']['elangle']
    azimuths = np.arange(0,360)

    ranges = np.arange(0, length, data['dataset1/where']['rscale']) # in meters
    polargrid = np.meshgrid(ranges, azimuths)

    lon, lat, alt = wrl.georef.polar2lonlatalt_n(polargrid[0], polargrid[1],
                                                 elevation, radar_location)

    bng = wrl.georef.epsg_to_osr(27700)

    x, y = wrl.georef.reproject(lon, lat, projection_target=bng)

    xgrid = np.linspace(x.min(), x.max(), 500)
    ygrid = np.linspace(y.min(), y.max(), 500)

    grid_xy = np.meshgrid(xgrid, ygrid)
    grid_xy = np.vstack((grid_xy[0].ravel(), grid_xy[1].ravel())).transpose()

    xy=np.concatenate([x.ravel()[:,None],y.ravel()[:,None]], axis=1)
    gridded = wrl.comp.togrid(xy, grid_xy, length, np.array([x.mean(), y.mean()]), depth.ravel(), wrl.ipol.Nearest)
    gridded = np.ma.masked_invalid(gridded).reshape((len(xgrid), len(ygrid)))
    gridded[gridded.mask] = -999
    return gridded,grid_xy

def copy_over_files():
   for hdf_file in  glob.glob('/srv/radar/shared_folder/HDF*C.z'):
      file_name = hdf_file.split('/')[-1]
      new_file = os.path.join('/mnt/data/radar_files/',file_name)

      if not os.path.exists(new_file):

           shutil.copyfile(hdf_file,new_file)
           print(hdf_file)


def make_tiff(file_path,raster_path,length):
    print('making',file_path)
    gridded, grid_xy = hdf2array(file_path, length)
    array_to_raster(gridded, grid_xy, raster_path)


def main_script():
    print('Processing radar...')
    files = os.listdir('/mnt/data/radar_tiffs/')

    for file in files:
        try:
            Image.open('/mnt/data/radar_tiffs/' + file)
        except:
            print('deleting')
            os.remove('/mnt/data/radar_tiffs/' + file)

    jobs = []

    for file in os.listdir('/mnt/data/radar_files/'):
        print(file)
        file_path = os.path.join('/mnt/data/radar_files/', file)
        b1, b2, b3, dt_string, b4, length, dist, b5, angle, b6 = file.split('-')
        length = float(length) * 100
        raster_file = '%s_%s_%s.tiff' % (dt_string, int(length), angle)

        raster_path = os.path.join('/mnt/data/radar_tiffs/', raster_file)
        if not os.path.exists(raster_path):
            p = multiprocessing.Process(target=make_tiff, args=(file_path,raster_path,length,))
            jobs.append(p)
            p.start()

main_script()
