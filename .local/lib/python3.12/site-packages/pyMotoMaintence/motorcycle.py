from pyMotoMaintence.util import loadMotorcycleMaintence

def loadMorotcycle(motorcycleMake: str, motorcycleType: str):
    motorcycleMaintence = loadMotorcycleMaintence(motorcycleMake, motorcycleType)
    return Motorcycle(motorcycleMaintence)


class Motorcycle():
    def __init__(self, motorcycleMaintence: dict):
        self.maintenceInfo = motorcycleMaintence

    def motorcycleExists():
        return len(self.maintenceInfo) != 0

    def getItem(self, item: str):
        pass

    def getNextMaintence(self, km=-1, miles=-1):
        pass

    def getTorqueValue(self, item: str):
        pass
