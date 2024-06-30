suma = 23

resta <- 10 - 4
suma - resta

# De esta forma se crea un vector, utilizando 'c'
x <- 10
vec <- c(1, 2, 3, 4, 5, 67, x)
vect <- c('Hola', 'Mundo')

# De esta forma mostramos posiciones específicas
vec[c(1,4)]
mayores <- vect > 2 # Esto solo regresa sin es verdadero o no
vec[vec > 2] # De esta forma regresa los valores

# Crear vectores con varios elementos
x <- 1:1000

z <- seq(1, 100, by = 0.1)
z^2

# Así se crea una matriz
x <- matrix(c(1,2,3,4,5,6), 2 ,3, byrow = TRUE)
length(x) # Número de elementos de la matriz
mode(x) # Tipo de la matriz
dim(x) # Para saber las dimensiones de la matriz
x[2,2]
x[2, ] # Muestra todos los elementos del row 2
x[ ,3] # Todos los elementos de la columna 3
x[2,3] <- 5 # Se asigna un valor a la fila 2, columna 3

x <- cbind(x,c(7, 8))
x <- rbind(x,c(7,8,10,10,10,10,10, 2))

x <- matrix(c(1,2,3,4), 2, 2, byrow= T)
x2 <- matrix(c(1,2,3,4), 2, 2, byrow = T)

x + x2
x - x2
x * 10
x * x2
x %*% x2
t(x) # Transpuesta
solve(x) # Inversa de la matriz
solve(x) %*% x #
det(x) # Determinante de una matriz

# -------------- EJERCICIO -------------- #
A <- matrix(c(2,7,3,5,3,0,0,8,1), 3, 3)
B <- matrix(c(5,8,9,4,13,10,1,0,2),3,3)

A + B
A %*% B
B %*% A
t(t(A))
solve(A)
round(solve(A)%*%A)


alumnos <- data.frame(
            nombre = c("JOSE", "LUIS", "MARIA"),
            edad = c(25,23,36),
            sexo = c("M", "M", "F")
)

View(alumnos) # Para ver la tabla como en exel

alumnos[1, ]
alumnos$edad


# -------- Ejercicio -----------
alumnos2 <- data.frame(
              Matricula = c(56, 65),
              Nombre = c("Claudio", "Ramon"),
              Sexo = c("M", "M"),
              Calificacion = c(8, 9.5)
)
