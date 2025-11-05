#Początek pracy 05.11.2025

#Instalacja paczek
install.packages(c("tidyverse","writexl"))

#ładowania paczek
library("tidyverse")

#utworzenie wektora z 5 liczbami
c(1,21,5,-8,2.5)

#utworzenie wektora zz 5 liczbami i przypisanie wartości
element<- c(8,-3,3.5,13,6)
element

#sprawdzenie struktury
str(element)
is.numeric(element)
is.character(element)

#wymuszenie typu
krewetka <- as.character(element)
krewetka #print krewetka w console
#sprawdzenie struktury
is.numeric(krewetka)

#obiekt 3 wyrazowy
renka <- c("piesek","kot","pancernik")
is.Date(renka)
#wymuszenie typu ponownie
as.numeric(renka) #as.numeric(renka) nie da się zamienić na liczby

as.numeric(krewetka)

#operacje matematyczne,bez przypisywaniawartości
0/1001-pi+sqrt(15)+log(66)
#operacje matematyczne z przypisywaniem wartości
ziema <- median(c(100,50,0.5,-pi,log(8)))+ mean(c(80,14,NA), na.rm=TRUE) #na.rm=TRUE nie uwzględnianie pustych miejsc
ziema

#Obiekt z wartościami NA
puszka <- c(NA,67, log(pi),NA) #z racji, że log(pi) ma 5 miejsc po przecinku, to 67, też wyskakuje 67.00000
puszka
mean(puszka,na.rm=TRUE)
mean(na.omit(puszka)) #również omija puste miejsca
