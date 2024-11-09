from app.Config.database import db

class ElementoPorCompuesto(db.Model):
    __tablename__ = 'elementos_por_compuesto'
    
    guid_elemento = db.Column(db.String, db.ForeignKey('parcial3.elementos.guid'), primary_key=True)
    guid_compuesto = db.Column(db.String, db.ForeignKey('parcial3.compuestos.guid'), primary_key=True)
    cantidad = db.Column(db.Integer, nullable=False)
    formula_quimica = db.Column(db.String(255), nullable=False)
