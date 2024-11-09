from app.Models.Compuesto import Compuesto
from app.Repositories.CompuestoRepository import CompuestoRepository
from app.Repositories.ElementosPorCompuestoRepository import ElementosPorCompuestoRepository

class CompuestoService:
    @staticmethod
    def listar_compuestos():
        return CompuestoRepository().get_all()

    @staticmethod
    def obtener_compuesto_por_guid(guid):
        return CompuestoRepository().get_by_id(guid)

    @staticmethod
    def agregar_compuesto(data, elementos_conformantes):
        compuesto = Compuesto(**data)
        CompuestoRepository().add(compuesto)
        
        for elemento in elementos_conformantes:
            ElementosPorCompuestoRepository().add(elemento)
        return compuesto

    @staticmethod
    def actualizar_compuesto(guid, data, elementos_conformantes):
        compuesto = CompuestoRepository().get_by_id(guid)
        if compuesto:
            for key, value in data.items():
                setattr(compuesto, key, value)
            CompuestoRepository().update()
            
            ElementosPorCompuestoRepository().delete_all_by_compuesto(guid)
            for elemento in elementos_conformantes:
                ElementosPorCompuestoRepository().add(elemento)
            return compuesto
        return None

    @staticmethod
    def eliminar_compuesto(guid):
        ElementosPorCompuestoRepository().delete_all_by_compuesto(guid)
        CompuestoRepository().delete(guid)