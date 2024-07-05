# -------- ---------
#Tip = B0 +B1 * Credit
modtip <- lm(Tip ~ Credit, RestaurantTips)

summary(modtip)

#Tip = 3.249 + 1.847 (0) = 3.249
#Tip = 3.249 + 1.84 (1) = 5

# Tip = B0 + B1 * Credit + B2 * Bill
modtip2 <- lm(Tip ~ Credit + Bill, RestaurantTips)
summary(modtip2)

#Tip = -0.29 + 0.04*Credit + 0.18*Bill 

#Credit = 0
#Tip = -0.29 + 0.18*Bill
#Credit = 1
#Tip = -0.29 + 0.04 * Credit + 0.18*Bill

RestaurantTips %>% 
  ggplot(aes(x = Bill, y = Tip, colour = Credit)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

#----------------------------------------------
#Tip = B0 + B1*ServA + B2*ServB + B3*ServC

modtip3 <- lm(Tip ~ Server, RestaurantTips)

#Server A
#Tip = 4.04
#Server B
#Tip = 4.04 - 0.60 
#Server C
#Tip = 4.04 + 0.28

summary(modtip3)

modtip4 <- lm(Tip ~ Server + Bill, RestaurantTips)
summary(modtip4)
anova(modtip4) # Para ver si el mesero (no uno en específico) es significativa para todo el modelo

#----------------------------------------------------
Boston$chas <- factor(Boston$chas)

modboston <- lm(medv ~ chas, Boston)
summary(modboston)

# ---------------------- RETO 12 -----------------------

# Sales = B0 + B1*Advertising + B2*US + e
Carseats$US <- factor(Carseats$US)
modSales <- lm(Sales ~ Advertising + US, Carseats)
summary(modSales)
# Sales = 6.76 + 0.12*Advertising + -0.082*US + e
predicSalesNo <- 6.76 + 0.12*3 -0.082*0
predicSalesYes <- 6.76 + 0.12*3 -0.082*1



# Sales = B0 + B1*Income + B2*ShelveLoc + e
modSales2 <- lm(Sales ~ Income + ShelveLoc, Carseats)
summary(modSales2)

# Todas las variables
modSales3 <- lm(Sales ~ ., Carseats)
summary(modSales3)

anova(modSales3)







# --------------------- -------------------------
library(caTools)

split <- sample.split(Carseats$Sales, SplitRatio = 0.8) #Selección aleatorio de las observaciones de mi conjunto de datos, primer parámetro: variable independiente que voy a analizar y después el porcentaje en el que lo voy a definir
table(split)

training <- subset(Carseats, split == T) #Guardar los datos que tienen verdadero a la variable training
testing <- subset(Carseats, split == F) # Lo mismo pero los datos falsos

# Generar un modelo con las observaciones de la variable training

mod3 <- lm(Sales~., training)
summary(mod3)

testing$predic <- predict(mod3, testing)

# --------- AIC ----------
AIC(modSales)
AIC(modSales2)
AIC(modSales3)



# ---------------- SELECCIÓN DE VARIABLES -------------------------
library(MASS)
modSales3 <- lm(Sales ~ ., Carseats)

modforward <- stepAIC(modSales3, direction = "forward", trace = T)
summary(modforward)

modbackward <- stepAIC(modSales3, direction = "backward", trace = T)
summary(modbackward)
AIC(modbackward)
AIC(modSales3)

modstep <- stepAIC(modSales3, direction = "both", trace = T)
summary(modstep)


# --------------- REGRESIÓN CON VARIABLES CUALITATIVAS
# Utiliza otro tipo de modelos
# Con un modelo lineal generalizado

# ------------------- RETO 13 ----------------------
modinsurance <- lm(charges ~ ., insurance)
summary(modinsurance)

insurancefor <- stepAIC(modinsurance, direction = "forward", trace = T)
summary(insurancefor)

insuranceback <- stepAIC(modinsurance, direction = "backward", trace = T)
summary(insuranceback)

insuranceboth <- stepAIC(modinsurance, direction = "both", trace = T)

AIC(insurancefor)
AIC(insuranceback)
AIC(insuranceboth)








































































































































































































