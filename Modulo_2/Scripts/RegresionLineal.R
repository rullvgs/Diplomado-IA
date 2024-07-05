#--- Librería dplyr ---------

library(tidyverse)

x <- rnorm(10000)

matrix(sort(abs(x)), ncol = 2)

# Tuberías: Toma los valores que vienen de la primera
# variale y se lo pasa a la siguiente función
xx <- x %>%
        abs %>% 
          matrix(, ncol = 2)

#----------------------------------------------
pastos <-  Cosecha_Jal %>%
                filter(Cultivo == "pastos")

mtcars %>%
  filter(carb != 5)

#-------------------- select ----------------------
mtcars %>%
  filter(mpg < 20) %>%  # Quita observaciones
    select(mpg, vs, am) # Quita columnas

# ------------------- mutate --------------------
#Crear variable nueva dentro de nuestra tabla

peso <- mtcars %>% 
          mutate(wtkg = wt * 0.4535) %>% 
            select(wt, wtkg)

mtcars %>% 
  filter(cyl == 6) %>% 
    mutate(wt = (wt * 0.45))

#------------------- arrange --------------------
mtcars %>% 
  arrange(desc(cyl), mpg) %>% 
    select(cyl, mpg)

# ------------------- summarise -------------------------
mtcars %>% 
  filter(cyl == 6 & am == 0) %>% 
  summarise(promedio = mean(mpg), varianza = var(mpg), desEst = sd(mpg))

mtcars %>% 
  group_by(cyl, am, vs) %>% 
    summarise(mean(mpg), sd(mpg), n())

#---------------------------------------------------------
alumno <- data.frame(nombre = c('JUAN', 'MARÍA', 'LUIS', 'SOFÍA'),
                                edades = c(NA, 23, 26, 35)
                                )
mean(alumno$edades, 
     na.rm = T # No toma NA o quita NA
     )
is.na(alumno)

table(alumno$edades, useNA = c("always"))

#--------------------------------
alumno
drop_na(alumno)
media <- mean(alumno$edades, na.rm = T)

alumno$edades <- replace_na(alumno$edades, media)
mean(alumno$edades)


# ------- Reto 7 ------------
# Obtener una tabla con las variables: estado, municipio, modalidad y variedad 
# donde la modalidad de riego es por temporal para el municipio Acatzingo

Frijol %>% 
  filter(Modalidad == 'Temporal' & NomMunicipio == 'Acatzingo') %>% 
    select(NomEstado, NomMunicipio, Modalidad, Variedad)

Frijol %>% 
  filter(SuperficieSembrada > 20000 & NomEstado == 'Sinaloa') %>% 
  select(NomEstado, SuperficieSembrada, Variedad, AñoAgricola, Modalidad)

Frijol %>% 
  filter( Variedad== 'Frijol bayo') %>% 
    summarise(max(SuperficieCosechada), min(SuperficieCosechada))

Frijol %>% 
  filter(SuperficieSembrada != SuperficieCosechada) %>% 
    select(SuperficieSembrada, SuperficieCosechada, Variedad)

# Obtener el promedio de la superficie sembrada por estado.
Frijol %>% 
  group_by(NomEstado) %>% 
    summarise(mean(SuperficieSembrada))

# Obtener máximo y promedio para cada una de las variedades de frijol.
Frijol %>% 
  group_by(Variedad) %>% 
    summarise(n(), mean(n()))

frijol <-  Frijol %>% 
            mutate(RenObt = ProducciónObtenida/SuperficieCosechada)
frijol$RenObt

# Calcula el número de observaciones en la variable “Superficie Con Sanidad Vegetal” 
# que tienen valores NA (Not Available). (Utiliza la función table con la opción 
# useNA = c(”always”))
table(Frijol$SuperficieConSanidadVegetal, useNA = "always")

media <- mean(Frijol$SuperficieConSanidadVegetal, na.rm = T)
Frijol$SuperficieConSanidadVegetal <- replace_na(Frijol$SuperficieConSanidadVegetal, media)
mean(Frijol$SuperficieConSanidadVegetal)
  
# --------------- ggplot ------------------------

data("mtcars")
library(Lock5Data)
data("NutritionStudy")



# Histograma
ggplot(data = mtcars) +
  geom_histogram(aes(x = mpg), bins = 8, color = "red", fill = "white") +
  geom_freqpoly(aes(x = mpg), bins = 8, color = "blue")

ggplot(data = mtcars, aes(x = mpg)) +
  geom_histogram(bins = 8, color = "red", fill = "white") +
  geom_freqpoly(bins = 8, color = "blue")

# Polígono
ggplot(data = mtcars) + 
  geom_freqpoly(aes(x = mpg), bins = 8, color = "blue") +
  coord_flip()


#Gráfica de barras
ggplot(NutritionStudy, aes(x=Smoke, fill = VitaminUse)) + 
  geom_bar(position = "dodge")

#Box-plot
ggplot(NutritionStudy, aes(Age, Smoke)) + 
  geom_boxplot(color = "blue", fill = "green") +
  #coord_flip() # Gira las coordenadas de la gráfica +
  #geom_point() +
  geom_jitter(color = "red", alpha = 0.1)

#Plot
NutritionStudy %>% 
    ggplot(aes(Age, Cholesterol, colour = Sex)) + 
      geom_point() +
        facet_wrap(~VitaminUse)

NutritionStudy %>% 
  ggplot(aes(Age, Cholesterol, colour = Sex)) + 
    geom_point() +
      facet_grid(PriorSmoke~VitaminUse)

NutritionStudy %>% 
  ggplot(aes(Age, Cholesterol, colour = Sex)) + 
  geom_point() +
  labs(title = "Gráfico de Colesterol vs Edad", 
       subtitle = "Nutrición", 
       x = "Edad",
       y = "Colesterol",
       colour = "Género"
       ) +
  theme_linedraw()


# ------------------------ RETO 8 ------------------------------

# Importa el DataSet Heart a R y se transforma las variables correspondientes a factor.
HEART$AHD <- factor(HEART$AHD)
HEART$Sex <- factor(HEART$Sex)
HEART$ChestPain <- factor(HEART$ChestPain)
HEART$RestECG <- factor(HEART$RestECG,
                        labels = c("Normal", "Anomalia", "Hipertrofia"))
HEART$ExAng <- factor(HEART$ExAng,
                      labels = c("NO", "SÍ"))
HEART$Slope <- factor(HEART$Slope,
                      labels = c("Ascendente", "Plano", "Descendente"))
HEART$Thal <- factor(HEART$Thal)
HEART$Ca <- factor(HEART$Ca)
HEART$Fbs <- factor(HEART$Fbs)

summary(HEART)

table(HEART$Sex)
mean(HEART$Age)
table(HEART$AHD)

# Crea una gráfica de barras para los pacientes que presentaron enfermedades cardíacas, 
# destacando en cada barra la proporción de pacientes hombres y mujeres mediante el uso 
# de colores diferenciados.
ggplot(HEART, aes(x = AHD, fill = Sex)) +
  geom_bar()

ggplot(HEART, aes(x = ChestPain, fill = Sex)) + 
  geom_bar(position = "dodge")

#Crea una gráfica de cajas y bigotes para la frecuencia cardiaca máxima alcanzada, 
#comparando a los pacientes que presentaron enfermedades cardiacas.
HEART %>% 
  filter(AHD == "Yes") %>% 
    ggplot(aes(MaxHR, AHD)) +
    geom_boxplot(color = "black", fill = "red") +
    geom_jitter(color = "blue", alpha = 0.4)


# Diseña un histograma con 7 barras para representar la distribución de edades 
# de los pacientes.

#intervalos <- 7
#rango <- max(HEART$Age) - min(HEART$Age)
#amplitud <- rango/intervalos
#minimo <- min(HEART$Age)
#limites <- minimo + amplitud * (0:intervalos)
# La variable cuantitativa se pasa a una variable cualitativa
#HEART$Age <- cut(HEART$Age, breaks = limites, include.lowest = T)

HEART %>% 
  ggplot(aes(Age)) +
  geom_histogram(color = "black", fill = "green", bins = 7)

# Crea un histograma y un polígono de frecuencias con 5 barras para 
# representar los niveles de colesterol en sangre de los pacientes.
HEART %>% 
  ggplot(aes(Chol)) + 
  geom_histogram(color = "black", fill = "red", bins = 5) +
  geom_freqpoly(color = "blue", bins = 5)

# Desarrolla una gráfica de dispersión que relacione la presión arterial 
# y los niveles de colesterol en sangre de los pacientes.
HEART %>% 
  ggplot(aes(RestBP, Chol, colour = Chol)) + 
  geom_point()

HEART %>% 
  ggplot(aes(RestBP, Chol, colour = Sex)) +
  geom_point()

#Elabora un conjunto de gráficas de dispersión que relacione la 
#presión arterial y los niveles de colesterol en sangre, coloreando 
#los puntos según la variable AHD y utilizando facet wrap() para 
#agregar como tercera variable los resultados del electrocardiograma
HEART %>% 
  ggplot(aes(RestBP, Chol, colour = AHD)) +
  geom_point() +
  facet_wrap(~RestECG)


# --------- CORRELACIÓN -----------
library(tidyverse)
data("mtcars")

PesoEstatura %>% 
  ggplot(aes(Estatura, Peso)) + 
  geom_point()

mtcars %>% 
  ggplot(aes(hp, mpg)) +
  geom_point()


# Covarianza
cov(PesoEstatura$Estatura, PesoEstatura$Peso)

#Coeficiente de Correlación
cor(PesoEstatura$Estatura, PesoEstatura$Peso)


# ----------- RETO 9 -------------------
library(tidyverse)
precipitacion %>% 
  ggplot(aes(Precipitacion, ppn)) +
  geom_point()

cov(precipitacion$Precipitacion, precipitacion$ppn)
cor(precipitacion$Precipitacion, precipitacion$ppn)

# Reto 9_ 2
ventas %>% 
  ggplot(aes(NumEmpleado, Ventas)) +
  geom_point()

cov(ventas$NumEmpleado, ventas$Ventas)
cor(ventas$NumEmpleado, ventas$Ventas)

# Reto 9 _ 3
faithful %>% 
  ggplot(aes(eruptions, waiting)) +
  geom_point()

cov(faithful$eruptions, faithful$waiting)
cor(faithful$eruptions, faithful$waiting)







# --------------- REGRESIÓN LINEAL ---------------
#Deben ser variables cuantitativas

#Sueldo = B0 +B1 * AñosExp

Sueldohat <-25792 + 9450 * 2

resid <- 43525 - Sueldohat

modSueldos <- lm(Sueldo~AñosExp, Sueldos)

ggplot(Sueldos, aes(AñosExp, Sueldo)) +
  geom_point() +
  geom_point(aes(2, y = Sueldohat, color = "red"))

Sueldos$pred <- predict(modSueldos)

Sueldos$resid <- Sueldos$Sueldo - Sueldos$pred

ggplot(Sueldos, aes(AñosExp, Sueldo)) +
  geom_point() +
  geom_point(aes(y = pred, color = "red"))

NuevoValores <- data.frame(AñosExp = c(2, 2.5, 3))

NuevoValores$pred <- predict(modSueldos, NuevoValores)
#-------------------------------------------
Sueldos %>% 
  ggplot(aes(AñosExp, Sueldo)) +
  geom_point() +
  geom_abline(intercept = 25792, slope = 9450)

#--------------------------------------------
Sueldos %>% 
  ggplot(aes(AñosExp, Sueldo)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)


# ---------------- RETO 10 -----------------
#Reto 10 _ 1
library(tidyverse)
precipitacion %>% 
  ggplot(aes(Precipitacion, ppn)) +
  geom_point()

#ppn = B0 +B1 * Precipitacion

# B0 es el intercepto
# B1 es el incremento por cada unidad de precipitación va a aumentar mi productivadad anual 0.59

modppn <- lm(ppn~Precipitacion, precipitacion)

#ppn = -29.37 + 0.59 * Precipitacion

predppn = -29.37 + 0.59 * 300

residuom = 80 - predppn

# Predicciones
predict(modppn)

#Ajustar el modelo / Línea del modelo ajustado
precipitacion %>% 
  ggplot(aes(Precipitacion, ppn)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

summary(modppn)

# Reto 10 _ 2
ventas %>% 
  ggplot(aes(NumEmpleado, Ventas)) + 
  geom_point()

#Ventas = B0 + B1*NumEmpleado

modVentas <- lm(Ventas~NumEmpleado, ventas)

# Ventas = -0.5894 + 0.4159*NumEmpleado
predVentas <- -0.5894 + 0.4159*10
residuo <- 4 - predVentas
predict(modVentas)

summary(modVentas)

#Ajustar el modelo / Línea del modelo ajustado
ventas %>% 
  ggplot(aes(NumEmpleado, Ventas)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

