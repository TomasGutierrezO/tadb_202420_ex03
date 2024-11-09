from app.Config.database import db
import uuid

class Compuesto(db.Model):
    __tablename__ = 'compuestos'
    __table_args__ = {'schema': 'parcial3'}
    
    guid = db.Column(db.String, primary_key=True, default=lambda: str(uuid.uuid4()))
    nombre = db.Column(db.String(255), nullable=False)
    formula = db.Column(db.String(255), nullable=False)
    masa_molar = db.Column(db.Float, nullable=False)
    estado_agregacion = db.Column(db.String(255), nullable=False)


    def to_dict(self):
        return {
            'guid': self.guid,
            'nombre': self.nombre,
            'formula': self.formula,
            'masa_molar': self.masa_molar,
            'estado_agregacion': self.estado_agregacion
        }