from app.Models.ElementosPorCompuesto import ElementoPorCompuesto
from app.Config.database import db
from app.Interfaces.IElementosPorCompuestoRepository import IElementosPorCompuestoRepository

class ElementosPorCompuestoRepository(IElementosPorCompuestoRepository):
    def add(self, elemento_por_compuesto):
        db.session.add(elemento_por_compuesto)
        db.session.commit()

    def delete(self, guid_elemento, guid_compuesto):
        elemento_por_compuesto = ElementoPorCompuesto.query.filter_by(
            guid_elemento=guid_elemento, guid_compuesto=guid_compuesto).first()
        if elemento_por_compuesto:
            db.session.delete(elemento_por_compuesto)
            db.session.commit()
