FROM ubuntu:16.04

RUN apt-get -qqy update && \
    apt-get install -qqy software-properties-common --no-install-recommends && \
    apt-add-repository -y ppa:ubuntugis/ppa && \
    apt-get install -y \
        wget \
        build-essential \
        gdal-bin \
        libgdal-dev \
        libspatialindex-dev \
        python \
        python-dev \
        python-pip \
        python-tk \
        idle \
        python-pmw \
        python-imaging \
        python-opencv \
        python-matplotlib \
        git-all \
		dos2unix \
        --no-install-recommends

RUN apt-add-repository ppa:ubuntugis/ubuntugis-unstable
RUN apt-get update
RUN apt-get -qqy install python-gdal

RUN pip install --upgrade pip

RUN pip install setuptools && \
    pip install geojson && \
    pip install shapely && \
    pip install ipython && \
    pip install jupyter && \
    pip install pandas && \
    pip install tifffile && \
	pip install numpy && \
	pip install scipy && \
	pip install h5py && \
	pip install netCDF4 && \
	pip install wradlib==0.11.2

# Clean-up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
