from pyMotoMaintenance.util import loadMotorcycleMaintenance

def loadMorotcycle(motorcycleMake: str, motorcycleType: str):
    motorcycleMaintenance = loadMotorcycleMaintenance(motorcycleMake, motorcycleType)
    return Motorcycle(motorcycleMaintenance)


class Motorcycle():
    def __init__(self, motorcycleMaintenance: dict):
        self.maintenanceInfo = motorcycleMaintenance

    def motorcycleExists():
        return len(self.maintenanceInfo) != 0

    def getItem(self, item: str):
        pass

    def getNextMaintenance(self, km=-1, miles=-1):
        pass

    def getTorqueValue(self, item: str):
        pass
