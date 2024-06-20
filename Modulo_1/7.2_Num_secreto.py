
numSecreto = int(input('Ingrese un número cualquiera: '))
adivinado = False

while not adivinado:
    numero = int(input('Adivina el número secreto: '))
    
    if (numSecreto == numero):
        print('Felicidades, adivinaste!')
        adivinado = True
    else: 
        print('Intenta de nuevo')