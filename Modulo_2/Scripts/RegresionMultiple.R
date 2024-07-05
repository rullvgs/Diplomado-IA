# ----------------- REGRESIÓN MÚLTIPLE ---------------
library(scatterplot3d)

summary(insectos)
cor(insectos) #Coeficiente de correlación de Pearson
# Variable independiente tiene queé ser una cuantitativa

#N_insectos = B0 + B1 * Temperatura + B2 * Humedad + error

graf3D <- scatterplot3d(x = insectos$Humedad,
              y = insectos$Temperatura,
              z = insectos$N_insectos,
              type = "h",
              xlab = "Humedad",
              ylab = "Temperatura",
              zlab = "Num Insectos")

modinsectos = lm(N_insectos~Temperatura + Humedad, insectos)

#N_insectos = 18.27 + 1.69*Temp + 1.62*Hum + error

predNI <- 18.27 + 1.691 * 15 + 1.627 * 70

residual <- 156 - predNI

predict(modinsectos)
insectos$pred <- predict(modinsectos)


valPred <- data.frame(Temperatura = c(16,17),
                      Humedad = c(158, 159))

# Este es el objetivo, predecir con valores no establecidos originalmente
predict(modinsectos, valPred)


# Plano del modelo ajustado
graf3D$plane3d(modinsectos)


summary(modinsectos)



# ------------- RETO 11 ------------------
graf3d <- scatterplot3d(x = Boston$dis,
                  y = Boston$rm,
                  z = Boston$medv,
                  type = "h",
                  xlab = "Distancia",
                  ylab = "Num Habitaciones",
                  zlab = "ValorMedViviendas")

modBoston <- lm(medv~dis+rm, Boston)

#medv = B0 + B1*dis + B2*rm + e
#medv = -34.64 + 0.49*dis + 8.8*rm

# valores - rm: 7.185 y dis: 4.9671; valor real: 34.7

predmedv <- -34.64 + 0.49*4.97 + 8.8*7.19
residual <- 34.7 - predmedv

predict(modBoston)

graf3d$plane3d(modBoston)

summary(modBoston)

valsProp <- data.frame(dis = c(2.4, 5.9, 4.2),
                       rm = c(4.3, 5.2, 3.5))

predict(modBoston, valsProp)


# probando con todas las variables.

modmedv <- lm(medv~crim+zn+indus+nox+rm+age+dis+rad+tax+ptratio+black+lstat, Boston)
summary(modmedv)




