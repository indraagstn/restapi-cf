#Test API CodeFood
#Indra AK

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from flask_restful import Api, Resource
import os

DB_HOST = os.environ['MYSQL_HOST']
DB_PORT = int(os.environ['MYSQL_PORT'])
DB_DBNAME = os.environ['MYSQL_DBNAME']
DB_USER = os.environ['MYSQL_USER']
DB_PWD = os.environ['MYSQL_PASSWORD']

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+mysqldb://{user}:{password}@{host}:{port}/{dbname}".format(
    user=DB_USER,
    password=DB_PWD,
    host=DB_HOST,
    port=DB_PORT,
    dbname=DB_DBNAME,
)
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"]=False
db = SQLAlchemy(app)
ma = Marshmallow(app)
api = Api(app)

class RecipeCategories(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name= db.Column(db.String(50))
    createdAt= db.Column(db.String(50))
    updatedAt= db.Column(db.String(50))

class RecipeCategoriesSchema(ma.Schema):
    class Meta:
        fields = ("id", "name", "createdAt", "updatedAt")

recipe_cat_schema = RecipeCategoriesSchema()
recipe_cats_schema = RecipeCategoriesSchema(many=True)


class RecipeCategoriesResource(Resource):
    def get(self):
        posts = RecipeCategories.query.all()
        return recipe_cats_schema.dump(posts)


api.add_resource(RecipeCategoriesResource,'/recipe-categories')

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=3030)