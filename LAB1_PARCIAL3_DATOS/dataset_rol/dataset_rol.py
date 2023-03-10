# -*- coding: utf-8 -*-
"""dataset_rol.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/19QEf6xRk3hL3Q8WSwTCEAWNPHD5LfhvB
"""

# Uso del Pip install para poder importar la librería faker
!pip install faker

# Importar librería pandas para manejar y analizar datos
import pandas as pd
# Importar librería uuid para crear identificadores únicos.
import uuid
# Importar librería random para generar datos aleatorios.
import random
# Importar el paquete faker para generar datos fasos.
from faker import Faker
# Importar la librería datetime para manejar fechas.
import datetime
from datetime import date

# Delimitación del rango del número de elementos.
num_rol = 5000

#Instanciación faker
faker = Faker()

# Una lista de 4 características para la entidad rol
atributos = [
    "var_id_rol",
    "var_nombre_rol",
    "dt_fecha_asigna_rol",
    "var_status_rol" 
]

#Arreglo con nombres de roles
nombre =[
    "Operador",
    "Ensamblador",
    "Analista",
    "Programador",
    "Tester",
    "Ayudante"
]

#Arreglo con estados del rol
status = [
    "Activo",
    "Inactivo"
]

# Creación de un DF para las 4 características de la entidad rol
df = pd.DataFrame(columns = atributos)

# Generar un identificador para cada rol
def idr_gen(n):
    """
    Función que se encarga de crear un id unico con nomenclatura básica
    ...
    
    Return
    ------
    "ROL-"+str(n+1) : str
        id generado con nomenclatura
    """
    return "ROL "+str(n+1) # id para rol

#Generacion de datos en cada atributo
df['var_id_rol'] = [idr_gen(i) for i in range(num_rol)]

# Generar un nombre para cada rol
def nombre_gen():
    """
    Función que toma de forma aleatoria un nombre de rol de su respectiva lista
    ...
    
    Return
    ------
    random.choice(nombre) : str
        nombre de rol seleccionado aleatoriamente
    """
    return random.choice(nombre)

df['var_nombre_rol'] = [nombre_gen() for i in range(num_rol)]

# Determinar un estado para cada rol
def status_gen():
    """
    Función que toma un estado de forma aleatoria
    ...
    
    Return
    ------
    random.choice(status) : str
        seleccion de estados usando metodo choice de la libreria random
    """
    return random.choice(status)

df['var_status_rol'] = [status_gen() for i in range(num_rol)]

# Determinar una fecha de asignación de rol para cada registro
def fechAsg_gen():
    """
    Función que genera la fecha de asignación del rol
    ...
    
    Return
    ------
    faker.date_between('-4y') : obj datetime.date
        Usa libreria faker para generar fechas entre 2 años antes a la fecha actual
    """
    return faker.date_between('-4y')

df['dt_fecha_asigna_rol'] = [fechAsg_gen() for i in range(num_rol)]

#Descarga de datos en archivo .cvs
df.to_csv('dataset_Roles.csv')

# Mostrar el conjunto de datos
pd.read_csv('dataset_Roles.csv', index_col=0)