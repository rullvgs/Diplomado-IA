contador = 0
while contador < 3:
    temperatura = int(input('Ingrese la temperatura del invernadero: '))
    humedad = int(input('Ingrese la humedad del invernadero (escala 1-100): '))

    if temperatura > 30:
        if humedad >= 30:
            print('En este invernadero solo se recomienda ventilación')
        else:
            print('En este invernadero se recomienda riego y ventilación')
    else:
        if humedad < 30:
            print('En este invernadero solo se recomienda riego')
        else:
            print('En este invernadero no se necesitan acciones')
    contador += 1