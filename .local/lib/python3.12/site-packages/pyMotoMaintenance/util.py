import json

from pathlib import Path
from importlib.resources import files

from jsonschema import validate

_motoDatabase = 'pyMotoMaintenance.moto-maintenance-db.db'
_motoSchema = 'pyMotoMaintenance.moto-maintenance-db.schema'
_maintenanceSchema = 'maintenance.schema.json'

def iterMotorcycleMakes() -> str:
    for resource in files(_motoDatabase).iterdir():
        if resource.is_dir():
            yield resource.name

def iterMotorcycleTypes(motorcycleMake: str) -> str:
    for resource in files(_motoDatabase).joinpath(motorcycleMake).iterdir():
        if resource.is_file():
            yield Path(resource.name).stem

def motorcycleMakeExists(motorcycleMake: str) -> bool:
    for make in iterMotorcycleMakes():
        if motorcycleMake.lower() == make:
            return True

    return False

def motorcycleTypeExists(motorcycleMake: str, motorcycleType: str) -> bool:
    for motoType in iterMotorcycleTypes(motorcycleMake):
        if motorcycleType.lower() == motoType:
            return True

    return False

def loadMotorcycleMaintenance(motorcycleMake: str, motorcycleType: str, safe=True) -> dict:
    outDict = {}

    if safe:
        if not motorcycleMakeExists(motorcycleMake):
            print(f"Warning: motorcycle make '{motorcycleMake}' doesn't exist!")
            return outDict
        if not motorcycleTypeExists(motorcycleMake, motorcycleType):
            print(f"Warning: motorcycle type '{motorcycleType}' doesn't exist!")
            return outDict

    makeDatabase = f'{_motoDatabase}.{motorcycleMake}'

    with files(makeDatabase).joinpath(f'{motorcycleType}.json').open('r') as fl:
        outDict = json.load(fl)

    return outDict

def loadMotorcycleMaintenances(motorcycles: dict, safe=True) -> dict:
    motoDict = {}

    for motoMake, motoType in motorcycles.items():
        motoDict[motoType] = loadMotorcycle(motoMake, motoType, safe)

    return motoDict

def validateMotorcycle(motorcycle: dict) -> bool:
    with files(_motoSchema).joinpath(_maintenanceSchema).open('r') as fl:
        schema = json.load(fl)

    try:
        validate(instance=motorcycle, schema=schema)
        return True
    except ValidationError as err:
        print(err)
        return False

def storeMotorcycle(motorcycle: dict, outFile="") -> bool:
    if outFile == '':
        outFile = f'{motorcycle["model"]}_{motorcycle["years"]}.json'

    if not validateMotorcycle(motorcycle):
        print("not valid motorcycle")
        return False

    with open(outFile, 'w', encoding='utf-8') as f:
        json.dump(motorcycle, f, ensure_ascii=False, indent=4)

    return True
