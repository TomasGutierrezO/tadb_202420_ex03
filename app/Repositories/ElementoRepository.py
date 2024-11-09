from app.Models.Elemento import Elemento
from app.Config.database import db
from app.Interfaces.IElementoRepository import IElementoRepository

class ElementoRepository(IElementoRepository):
    def get_all(self):
        return Elemento.query.all()

    def get_by_id(self, guid):
        return Elemento.query.get(guid)

    def add(self, elemento):
        db.session.add(elemento)
        db.session.commit()

    def update(self):
        db.session.commit()

    def delete(self, guid):
        elemento = self.get_by_id(guid)
        if elemento:
            db.session.delete(elemento)
            db.session.commit()
