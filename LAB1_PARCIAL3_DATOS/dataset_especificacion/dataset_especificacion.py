# -*- coding: utf-8 -*-
"""dataset_especificacion.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/19ovyaB0ghYNPMsScSgIA2INpkMXiTU-x
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

# Delimitación del rango del número de elementos.
num_cumplir = 5000

#Instanciación faker
faker = Faker()

# Una lista de 3 características de la entidad cumplir
features = [
    "var_descripcion_esp",
    "var_id_mis",
    "var_id_par"
]
# Creación de un DF para estas características
df = pd.DataFrame(columns=features)

# Descripción
import string
import random
bio=[]
length_of_string = 20
random.seed()
for i in range(0, num_cumplir):
  bio=(''.join(random.SystemRandom().choice(string.ascii_letters + string.digits) for i in range(length_of_string)))
  df.var_descripcion_esp[i]=bio

# Fk "Id_par"
def idm_gen(n):
    """
    Función que se encarga de crear un id unico con nomenclatura básica
    ...
    
    Parametros
    ----------
    n : int
        representa el numero de indice correspondiente al registro
    
    Return
    ------
    "PRMT "+str(n+1) : str
        nomenclatura única de identificación del parametro correspondiente
    """
    return "PRMT "+str(n+1)

df['var_id_par'] = [idm_gen(i) for i in range(num_cumplir)]

# FK "Id_mis"
def idm_gen(n):
    """
    Función que se encarga de crear un id unico con nomenclatura básica
    ...
    
    Parametros
    ----------
    n : int
        representa el numero de indice correspondiente al registro
    
    Return
    ------
    "MSL "+str(n+1) : str
        nomenclatura única de identificación del misil correspondiente
    """
    return "MSL "+str(n+1)

df['var_id_mis'] = [idm_gen(i) for i in range(num_cumplir)]

# Guardar el conjunto de datos
df.to_csv('dataset_cumplir.csv')

# Mostrar el conjunto de datos
pd.read_csv('dataset_cumplir.csv', index_col=0)