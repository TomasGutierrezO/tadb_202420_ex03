from app.Config.database import db
import uuid

class Elemento(db.Model):
    __tablename__ = 'elementos'
    __table_args__ = {'schema': 'parcial3'}
    
    guid = db.Column(db.String, primary_key=True, default=lambda: str(uuid.uuid4()))
    nombre = db.Column(db.String(255), nullable=False)
    simbolo = db.Column(db.String(255), nullable=False)
    numero_atomico = db.Column(db.Integer, nullable=False)
    configuracion_electronica = db.Column(db.String(255), nullable=False)

    def to_dict(self):
        return {
            'guid': self.guid,
            'nombre': self.nombre,
            'simbolo': self.simbolo,
            'numero_atomico': self.numero_atomico,
            'configuracion_electronica': self.configuracion_electronica
        }
