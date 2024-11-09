from app.Models.Elemento import Elemento
from app.Repositories.ElementoRepository import ElementoRepository

class ElementoService:
    @staticmethod
    def listar_elementos():
        return ElementoRepository().get_all()

    @staticmethod
    def obtener_elemento_por_guid(guid):
        return ElementoRepository().get_by_id(guid)

    @staticmethod
    def agregar_elemento(data):
        elemento = Elemento(**data)
        ElementoRepository().add(elemento)
        return elemento

    @staticmethod
    def actualizar_elemento(guid, data):
        elemento = ElementoRepository().get_by_id(guid)
        if elemento:
            for key, value in data.items():
                setattr(elemento, key, value)
            ElementoRepository().update()
            return elemento
        return None

    @staticmethod
    def eliminar_elemento(guid):
        ElementoRepository().delete(guid)