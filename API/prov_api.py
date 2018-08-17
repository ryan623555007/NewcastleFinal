from provstore.api import Api
from flask import Flask, jsonify, render_template, request
from pymongo import MongoClient
import json

'''
Define the flask name
'''
app = Flask(__name__)

'''
This is the method that receive the request and return the data to servlet
'''
@app.route('/trans1', methods=['POST','GET'])
def homepage():
    jsonName = request.json
    # print(type(jsonName))
    Name = jsonName["index"]
    print(Name)
    document = mongo(Name)
    prov = document["prov"]
    print("result",prov)
    picture = document["picture"]
    print("picture",picture)
    return jsonify({"prov": prov,"picture":picture})

'''
This is the method that retrive the provenance from the provenance store
'''
def get_prov():
    api = Api(username="ryan", api_key="70dd9d23b545db0f4baca887f229641f374a3dca")
    stored_document = api.document.get(118313)
    d1 = stored_document.prov
    # print(d1.get_provn())
    print(d1.serialize(indent=2))
    return d1.serialize(indent=2)
    
'''
This is the method that link to MongoDB and get the json data
'''
def mongo(input):
    client = MongoClient('localhost', 27017)
    client.database_names()
    db = client.prov

    d = []
    for i in db.col.find( {}, { "index": 1, "_id":0 } ):
        k = i["index"]
        d.append(k)
    print(d)

    for j in range(len(d)):
        if input == d[j]:        
            result = db.col.find_one({"index": input},{'_id': False})
            r=result
            print(r)
            break
        else:   
            r={"index":'nothing',"prov":"No record","picture": 0}

    return r
            

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)

