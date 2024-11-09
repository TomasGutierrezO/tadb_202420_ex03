from abc import ABC, abstractmethod

class ICompuestoRepository(ABC):
    @abstractmethod
    def get_all(self):
        pass

    @abstractmethod
    def get_by_id(self, guid):
        pass

    @abstractmethod
    def add(self, compuesto):
        pass

    @abstractmethod
    def update(self):
        pass

    @abstractmethod
    def delete(self, guid):
        pass
