from app.Models.Compuesto import Compuesto
from app.Config.database import db
from app.Interfaces.ICompuestoRepository import ICompuestoRepository

class CompuestoRepository(ICompuestoRepository):
    def get_all(self):
        return Compuesto.query.all()

    def get_by_id(self, guid):
        return Compuesto.query.get(guid)

    def add(self, compuesto):
        db.session.add(compuesto)
        db.session.commit()

    def update(self):
        db.session.commit()

    def delete(self, guid):
        compuesto = self.get_by_id(guid)
        if compuesto:
            db.session.delete(compuesto)
            db.session.commit()

