# Problema:
# Escriba un programa que procese una lista de estudiantes con sus respectivas calificaciones en diferentes materias,
# calcule el promedio de cada estudiante y luego ordene a los estudiantes por su promedio en orden descendente.

# Instrucciones:
# 1. Defina una lista de diccionarios, donde cada diccionario representa un estudiante y contiene su nombre y sus calificaciones en diferentes materias.
# 2. Calcule el promedio de calificaciones de cada estudiante.
# 3. Añada el promedio al diccionario de cada estudiante.
# 4. Ordene la lista de estudiantes por el promedio en orden descendente.
# 5. Imprima la lista ordenada de estudiantes con sus promedios.

# Definir la lista de diccionarios con los estudiantes y sus calificaciones
estudiantes = [
    {"nombre": "Alice", "matematicas": 85, "literatura": 78, "ciencia": 92},
    {"nombre": "Bob", "matematicas": 89, "literatura": 94, "ciencia": 85},
    {"nombre": "Charlie", "matematicas": 72, "literatura": 67, "ciencia": 80},
    {"nombre": "David", "matematicas": 90, "literatura": 88, "ciencia": 91},
    {"nombre": "Eva", "matematicas": 88, "literatura": 76, "ciencia": 85}
]


for estudiante in estudiantes:
    promedio = (estudiante["matematicas"] + estudiante["literatura"] + estudiante["ciencia"]) / 3
    estudiante["promedio"] = promedio


for i in range(len(estudiantes)):
    max_idx = i
    for j in range(i+1, len(estudiantes)):
        if estudiantes[j]["promedio"] > estudiantes[max_idx]["promedio"]:
            max_idx = j
    estudiantes[i], estudiantes[max_idx] = estudiantes[max_idx], estudiantes[i]


for estudiante in estudiantes:
    print(f'Nombre: {estudiante["nombre"]}, Promedio: {estudiante["promedio"]:.2f}')
