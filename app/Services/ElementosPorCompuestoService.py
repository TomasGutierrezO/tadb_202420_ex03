from app.Models.ElementosPorCompuesto import ElementoPorCompuesto
from app.Repositories.ElementosPorCompuestoRepository import ElementosPorCompuestoRepository

class ElementosPorCompuestoService:
    @staticmethod
    def agregar_elemento_por_compuesto(data):
        elemento_por_compuesto = ElementoPorCompuesto(**data)
        ElementosPorCompuestoRepository().add(elemento_por_compuesto)
        return elemento_por_compuesto

    @staticmethod
    def eliminar_elemento_por_compuesto(guid_elemento, guid_compuesto):
        ElementosPorCompuestoRepository().delete(guid_elemento, guid_compuesto)