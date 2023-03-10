# -*- coding: utf-8 -*-
"""dataset_componente.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1Pl9tv5nkWVtalRn2xftTw8lbcSf-z3TW

# Conjunto de datos para la entidad "Componentes"
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
num_componentes = 5000

# Una lista de 3 características para la entidad componente
features = [
    "var_id_com",
    "var_nombre_com",
    "var_tipo_com",
    "var_status_com"
]
# Creación de un DF para estas características
df = pd.DataFrame(columns=features)

# Generar Identificadores para cada componente
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
    "COMPT "+str(n+1) : str
        nomenclatura única de identificación del misil correspondiente
    """
    return "COMPT "+str(n+1)

df['var_id_com'] = [idm_gen(i) for i in range(num_componentes)]

# Tipo de componente
Tipo_com = ["Electronics",
            "Chemistry",
            "other"]

df['var_tipo_com'] = random.choices(
    Tipo_com, 
    weights=(35,35,30), 
    k=num_componentes
)
"""
Con la lista generada de las opciones de tipos de componente, se proporciona la
función de opciones pesos para cada función y la cantidad de opciones hacer representadas
por "k". Por consiguiente, se asignó al atributo de "var_tipo_com" del marco de datos.
"""

# Nombre del componente
# Creación de instancias de falsificador
faker = Faker()

def name_gen(institution):
    """
    Genera rápidamente un nombre del componente
    """
    faker.nic_handle()
        
    return faker.nic_handle()
    
# Generación de nombres para cada componente
df['var_nombre_com'] = ['Compt '+name_gen(i) for i in df['var_tipo_com']]

# Estado del departamento
Status_com = ["Completo", "Incompleto"]

df['var_status_com']= random.choices(
    Status_com, 
    weights=(45,55), 
    k=num_componentes
)
"""
Con la lista generada de las opciones de estados, se proporciona la
función de opciones pesos para cada función y la cantidad de opciones hacer representadas
por "k". Por consiguiente, se asignó al atributo de "var_status_dept" del marco de datos.
"""

# Guardar el conjunto de datos
df.to_csv('dataset_componentes.csv')

# Mostrar el conjunto de datos
pd.read_csv('dataset_componentes.csv', index_col=0)