MaizOloton$Longitud

freqAbs <- table(MaizOloton$Longitud) # Esta función da la frecuencia absoluta

cumsum(freqAbs) # Esta función calcula la frecuencia absoluta acumulada

round(prop.table(table(MaizOloton$Longitud)),3) * 100 # Esta función calcula la frecuencia relativa

cumsum(prop.table(table(MaizOloton$Longitud))) * 100 # Esta función calcula la frecuencia relativa acumulada

# ------------------------------------------------

table(MaizOloton$Longitud, MaizOloton$Ancho) # Tabla de frecuencia absoluta de dos vías
prop.table(table(MaizOloton$Longitud, MaizOloton$Ancho)) * 100 # Tabla de frecuencia relativa de dos vías

#-------------------------------------------------
#Reto 4
data("mtcars")
help("mtcars")
mtcars$gear

sort(mtcars$gear, decreasing = F) # Para ordenar de mayor a menor o viceversa


# Apartado 1. ---------------
# Frecuencia absoluta de autos con 8 cilindros
table(mtcars$cyl)
# Frecuencia relativa de autos con 3 carburadores
round(prop.table(table(mtcars$carb)) * 100, 2)

# Cantidad de autos con transmisión automática
table(mtcars$am)

# Porcentaje de autos con transmisión manual
prop.table(table(mtcars$am)) * 100

# Cantidad de autos con 4 o menos carburadores(carb)
cumsum(prop.table(table(mtcars$carb)) * 100)

# Apartado 2
# Cantidad de autos con transmisión automática y ocho cilindros
table(mtcars$am, mtcars$cyl)

# Porcentaje de autos con transmisión automática y cuatro cilindros
prop.table(table(mtcars$am, mtcars$cyl)) * 100

# Reto 5 --------- DATOS HEART
# Apartado 1 -----
# Frecuencia Absoluta personas que no presentaron enfermedad en el corazón
table(HEART$AHD)

# Frecuencia Relativa de hombres
prop.table(table(HEART$Sex)) * 100

# Porcentaje de personas que presentaron enfermedad en el corazón
prop.table(table(HEART$AHD)) * 100

# Cantidad de personas con 40 años o menos

cumsum(table(HEART$Age))

# Apartado 2 ----------
# Construya una tabla de dos vías para obtener la frecuencia absolutas y relativas utilizando las variables AHD y Sexo. Explique los resultados obtenidos
table(HEART$AHD, HEART$Sex)

round(prop.table(table(HEART$AHD, HEART$Sex)) * 100, 2)



# Colesterol en sangre en mg ----------------------
table(HEART$Chol)



# ----------- DURAZNO -------------------
Durazno$Perimetro
table(Durazno$Perimetro)

intervalos <- 3
rango <- max(Durazno$Perimetro) - min(Durazno$Perimetro)
amplitud <- rango/intervalos

minimo <- min(Durazno$Perimetro)
limites <- minimo + amplitud * (0:intervalos)

# La variable cuantitativa se pasa a una variable cualitativa
clases <- cut(Durazno$Perimetro, breaks = limites, include.lowest = T) # Conjunto de datos que se van a clasificar
#-----------------------------
table(clases)
cumsum(table(clases))
prop.table(table(clases)) * 100
cumsum(prop.table(table(clases)) * 100)


#--------------------------------------------------------------
hist(Durazno$Perimetro, 
     breaks = limites,
     freq = F, # Esto genera un histograma de las frecuencias relativas
     include.lowest = T,
     main = 'Histograma del Perímetro',
     xlab = 'Perímetro'
     )


# Reto 6
# Realizar una tabla de frecuencias e histograma con cinco intervalos del peso del durazno para el diseño de una máquina seleccionadora requerida en la agroindustria 
intervalos <- 5
rango <- max(Durazno$Peso) - min(Durazno$Peso)
amplitud <- rango/intervalos

minimo <- min(Durazno$Peso)
limites <- minimo + amplitud * (0:intervalos)

clases <- cut(Durazno$Peso, breaks = limites, include.lowest = T)
table(clases)
cumsum(table(clases))
prop.table(table(clases)) * 100
cumsum(prop.table(table(clases)) * 100)
hist(Durazno$Peso,
     breaks = limites,
     main = 'Histograma del Peso')

# crear una tabla de frecuencias e histograma para el extremo B del invernadero
intervalos <- round(1 + 3.322*(log10(length(Invernadero$`Extremo B`))))
rango <- max(Invernadero$`Extremo B`) - min(Invernadero$`Extremo B`)
amplitud <- rango/intervalos

minimo <- min(Invernadero$`Extremo B`)
limites <- minimo + amplitud * (0:intervalos)

clases <- cut(Invernadero$`Extremo B`, breaks = limites, include.lowest = T)
table(clases)
cumsum(table(clases))
prop.table(table(clases)) * 100
cumsum(prop.table(table(clases)) * 100)

hist(Invernadero$`Extremo B`,
     breaks = limites,
     main = 'Histograma del extremo B del invernadero')


# Realizar tabla de frecuencias utilizando los datos de una seleccionadora de 
# manzanas de la variedad Golden Delicious(manzanas.xls). 
#Se deben crear tres clases de acuerdo con la clasificación especificada en 
#la siguiente tabla.

limites <- c(min(Manzanas$EjeLongitudinal), 68, 72, 80)
clases <- cut(Manzanas$EjeLongitudinal, breaks = limites, include.lowest = T)
table(clases)
cumsum(table(clases))
round(prop.table(table(clases)) * 100, 2)
round(cumsum(prop.table(table(clases)) * 100), 2)



# ----------------------------------------------
data("mtcars")
summary(mtcars)

mtcars$vs <- factor(mtcars$vs,
                    labels = c("V", "S"))

mtcars$am <- factor(mtcars$am,
                    labels = c("automatic", "manual"))

mtcars$cyl <- factor(mtcars$cyl,
                     ordered = T)

mtcars$carb <- factor(mtcars$carb,
                      ordered = T)

mtcars$gear <- factor(mtcars$gear)

#-------------------------------
#Promedio
mean(mtcars$mpg) # Calcular el promedio
#Mediana
median(mtcars$mpg)
#Moda
names(sort(table(MaizOloton$Longitud), decreasing = T)[1])

#--------------------------------
#varianza
var(mtcars$mpg)
#Desviación Estandar DS
sd(mtcars$mpg)
sqrt(var(mtcars$mpg))
#Coeficiente de variación CV
sd(mtcars$mpg) / mean(mtcars$mpg) * 100

#---------------------------------------
# CUARTILES
quantile(mtcars$mpg)
summary(mtcars$mpg)
quantile(mtcars$mpg,
         probs = seq(0.1,by=0.1))

boxplot(mtcars$mpg,
        horizontal = T)

boxplot(mtcars$hp ~ mtcars$am, horizontal = T)

#----------------------------------------
kurtosis(mtcars$hp)
#Coeficiente de asimetría
skewness(mtcars$mpg)
boxplot(mtcars$mpg, horizontal = T)
hist(mtcars$mpg)

#-----------------------------------------
tapply(mtcars$mpg, mtcars$cyl, var)


#----------- Reto -----------------
library('Lock5Data')
data("NutritionStudy")
summary(NutritionStudy)

NutritionStudy$Smoke <- factor(NutritionStudy$Smoke)
NutritionStudy$Vitamin <- factor(NutritionStudy$Vitamin)
NutritionStudy$Sex <- factor(NutritionStudy$Sex)
NutritionStudy$VitaminUse <- factor(NutritionStudy$VitaminUse)
NutritionStudy$PriorSmoke <- factor(NutritionStudy$PriorSmoke)

# Media y mediana de fibra consumida al día
mean(NutritionStudy$Fiber)
median(NutritionStudy$Fiber)

# Media y desviación estandar de edad de las personas del estudio
round(mean(NutritionStudy$Age))
sd(NutritionStudy$Age)

# Obtener el cantidad de personas fumadoras y no fumadoras.
table(NutritionStudy$Smoke)

# Construye un grafica donde se comparen los diagramas de cajas 
# el colesterol por el tipo de fumador (PriorSmoke).
boxplot(NutritionStudy$Cholesterol ~ NutritionStudy$PriorSmoke, horizontal = T)

tapply(NutritionStudy$Calories, NutritionStudy$Sex, mean)
tapply(NutritionStudy$Calories, NutritionStudy$Sex, sd)

#--- Reto 6 _ 2 -----
summary(Cosecha_Jal)

Cosecha_Jal$Cultivo <- factor(Cosecha_Jal$Cultivo)
Cosecha_Jal$Estado <- factor(Cosecha_Jal$Estado)

mean(Cosecha_Jal$Superficie)
median(Cosecha_Jal$Superficie)
var(Cosecha_Jal$Superficie)
sd(Cosecha_Jal$Superficie)

quantile(Cosecha_Jal$Superficie)
boxplot(Cosecha_Jal$Superficie, horizontal = T)


# Promedio y sd de superficie por cada cultivo 
tapply(Cosecha_Jal$Superficie, Cosecha_Jal$Cultivo, sd)

# Calcular el coeficiente de asimetría y curtosis para la superficie 
# cosechada del estado de Jalisco y definir que el tipo de curva.
skewness(Cosecha_Jal$Superficie)
kurtosis(Cosecha_Jal$Superficie)
hist(Cosecha_Jal$Superficie)

boxplot(Cosecha_Jal$Superficie ~ Cosecha_Jal$Cultivo, horizontal = F)
