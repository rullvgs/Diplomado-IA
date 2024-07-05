"""
Módulo de operaciones básicas.

Este módulo contiene funciones para realizar operaciones aritméticas básicas.
"""

def suma(a, b):
    """
    Suma dos números.

    :param a: El primer número.
    :param b: El segundo número.
    :return: La suma de a y b.
    """
    return a + b

def resta(a, b):
    """
    Resta dos números.

    :param a: El primer número.
    :param b: El segundo número.
    :return: La resta de a menos b.
    """
    return a - b

def multiplicacion(a, b):
    """
    Multiplica dos números.

    :param a: El primer número.
    :param b: El segundo número.
    :return: El producto de a y b.
    """
    return a * b

def division(a, b):
    """
    Divide dos números.

    :param a: El primer número.
    :param b: El segundo número.
    :return: El cociente de a dividido por b.
    :raises ValueError: Si b es 0.
    """
    if b == 0:
        raise ValueError("No se puede dividir por cero")
    return a / b