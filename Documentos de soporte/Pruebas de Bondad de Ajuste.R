library(MASS)
library(survival)
library(fitdistrplus)


datosC <- read_excel("2018-2/Simulacion/datosr.xlsx", 
                     sheet = "Chocolate")
datosJ <- read_excel("2018-2/Simulacion/datosr.xlsx", 
                     sheet = "Japones2")

library(readxl)
datosC <- read_excel("datosr.xlsx", sheet = "Chocolate")
datosJ <- read_excel("datosr.xlsx", sheet = "Japones")

library(readxl)
datosJ <- read_excel("datosr.xlsx", sheet = "Japones2")

library(readxl)
datosr <- read_excel("datosr.xlsx")
View(datosr)

#japones
cantidadCompletadaJ <- datosJ$`Cantidad Completada`
tiempoOpeJ <- datosJ$`Tiempo Neto Operacion`
tamanioBacheJ <- 60
horasKiloJ <- tiempoOpeJ/cantidadCompletadaJ
bachesHoraJ <- tamanioBacheJ * horasKiloJ
numBachesJ<-cantidadCompletadaJ/tamanioBacheJ
numBachesMenos<-floor((numBachesJ * 100) / 100)


hist(bachesHoraJ, main = "Histograma de la serie de datos", las=1, prob=FALSE)
ajuste <- fitdist(bachesHoraJ, "lnorm")
ajuste$estimate
plot(ajuste)
resultados <- gofstat(ajuste)
resultados$kstest
resultados$chisqpvalue

acf(bachesHoraC, lag(20))

#chocolate
cantidadCompletadaC <- datosC$`Cantidad Completada`
tiempoOpeC <- datosC$`Tiempo Neto Operacion`
tamanioBacheC <- 60
horasKiloC <- tiempoOpeC/cantidadCompletadaC
bachesHoraC <- tamanioBacheC * horasKiloC
numBachesC<-cantidadCompletadaC/tamanioBacheC
numBachesMenosC<-floor((numBachesC * 100) / 100)

hist(bachesHoraC, main = "Histograma de la serie de datos", las=1, prob=FALSE)
ajuste <- fitdist(bachesHoraC, "lnorm")
ajuste$estimate
plot(ajuste)
resultados <- gofstat(ajuste)
resultados$kstest
resultados$chisqpvalue
