from flask import Flask
from flask_cors import CORS
from app.Config.database import db, Config
from app.Controllers.CompuestoController import compuesto_blueprint
from app.Controllers.ElementoController import elemento_blueprint
from app.Controllers.ElementosPorCompuestoController import elemento_por_compuesto_blueprint

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    CORS(app)

    db.init_app(app)

    # Registra los blueprints de los controladores
    app.register_blueprint(compuesto_blueprint)
    app.register_blueprint(elemento_blueprint)
    app.register_blueprint(elemento_por_compuesto_blueprint)

    return app

if __name__ == '__main__':
    app = create_app()
    app.run()