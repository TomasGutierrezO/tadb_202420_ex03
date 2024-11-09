from abc import ABC, abstractmethod

class IElementosPorCompuestoRepository(ABC):
    @abstractmethod
    def add(self, elemento_por_compuesto):
        pass

    @abstractmethod
    def delete(self, guid_elemento, guid_compuesto):
        pass
