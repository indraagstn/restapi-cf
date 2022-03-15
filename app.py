#API CodeFood Test
#Indra AK

from flask import Flask, jsonify
from flask_restful import Api, Resource

import MySQLdb
import os
import datetime

DB_HOST = os.environ['MYSQL_HOST']
DB_PORT = int(os.environ['MYSQL_PORT'])
DB_DBNAME = os.environ['MYSQL_DBNAME']
DB_USER = os.environ['MYSQL_USER']
DB_PWD = os.environ['MYSQL_PASSWORD']


cnx = MySQLdb.connect(
    host=DB_HOST,
    port=DB_PORT,
    db=DB_DBNAME,
    user=DB_USER,
    passwd=DB_PWD,
)
cursor = cnx.cursor()

app = Flask(__name__)
api = Api(app)


def conv_ts(o):
    if isinstance(o, datetime.datetime):
        return o.__str__()

class RecipeCategories(Resource):
    def get(self):
        q = "SELECT * from `recipe-categories`"
        cursor.execute(q)
        row_headers = [x[0] for x in cursor.description]
        data = cursor.fetchall()
        #conv datetime
        data2=[list(i) for i in data]
        for i in range(len(data2)):
            data2[i][2]=data2[i][2].isoformat()+"Z"
            data2[i][3]=data2[i][3].isoformat()+"Z"
        #json data result
        json_data=[]
        for result in data2:
            json_data.append(dict(zip(row_headers,result)))
        payload = {"success":True,"message":"Success","data":json_data}
        return payload

class Home(Resource):
    def get(self):
        return "home - IAK"

api.add_resource(RecipeCategories, '/recipe-categories')
api.add_resource(Home, '/')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=3000)