# Problema:
# Escriba un programa que calcule el valor de x para el que la función f(x) = x^2 - 6x + 3 obtiene su menor resultado.
# Centre la búsqueda en el rango [-9, 9] sólo con valores enteros.

# Instrucciones:
# 1. Defina la función f(x) = x^2 - 6x + 3.
# 2. Inicialice una variable para almacenar el valor mínimo de la función (min_f) y otra para el valor de x correspondiente (min_x).
# 3. Use un bucle for para iterar sobre los valores enteros de x en el rango [-9, 9].
# 4. Para cada valor de x, evalúe la función f(x).
# 5. Compare el resultado con min_f. Si es menor, actualice min_f y min_x.
# 6. Imprima el valor de x que minimiza f(x) y el valor mínimo de f(x).
import math

min_x = None
min_f = None


for x in range(-9,10):
    f_x = math.pow(x, 2) - 6*x + 3
    if min_f is None or f_x < min_f:
        min_f = f_x
        min_x = x

# Imprimir el resultado
print(f'El valor de x que minimiza f(x) es: {min_x}')
print(f'El valor mínimo de f(x) es: {min_f}')

