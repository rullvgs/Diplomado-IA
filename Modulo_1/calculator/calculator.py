"""
Módulo principal de la calculadora.

Este módulo proporciona una interfaz para realizar operaciones básicas y avanzadas.
"""
import math
from .basic_operations import suma, resta, multiplicacion, division
from .advanced_operations import potencia, raiz_cuadrada, logaritmo

class Calculadora:
    """
    Clase Calculadora que proporciona métodos para realizar operaciones matemáticas.
    """

    @staticmethod
    def suma(a, b):
        return suma(a, b)

    @staticmethod
    def resta(a, b):
        return resta(a, b)

    @staticmethod
    def multiplicacion(a, b):
        return multiplicacion(a, b)

    @staticmethod
    def division(a, b):
        return division(a, b)

    @staticmethod
    def potencia(base, exponente):
        return potencia(base, exponente)

    @staticmethod
    def raiz_cuadrada(numero):
        return raiz_cuadrada(numero)

    @staticmethod
    def logaritmo(numero, base=math.e):
        return logaritmo(numero, base)
