from flask_sqlalchemy import SQLAlchemy
import os

# Configuración de la base de datos
class Config:
    SQLALCHEMY_DATABASE_URI = "postgresql://walterwhite_usr:0uX1Ihn0WkaPh8kzHYJsscofokgUAWoz@dpg-cslrole8ii6s73ar5qog-a.oregon-postgres.render.com/breakingbad_db"
    SQLALCHEMY_TRACK_MODIFICATIONS = False

db = SQLAlchemy()
