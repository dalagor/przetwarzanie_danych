#Ładowanie paczek na początku skryptu
library(tidyverse)

#Ładowanie liku z www
nowa_zelandia<-readr::read_csv("https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2024-financial-year-provisional/Download-data/annual-enterprise-survey-2024-financial-year-provisional.csv")

str(nowa_zelandia)

#Wczytywanie z dysku (ścieżka względna)
nowa_zel <- readr::read_csv("annual-enterprise-survey-2024-financial-year-provisional.csv")

#Indeksowanie i operacje różne 

nowa_zel #Wybór kolumny danych (w terminalu pokazują się wszystkie kolumny)

nowa_zel[1] #Wybór kolumny z rokiem (pierwsza kolumna)
nowa_zel["Year"] #Wybór kolumny z rokiem (po nazwie kolumy)
nowa_zel[,1] #Wybór kolumny z rokiem (wszystkie wiersze)-działa ze wszystkimi ramkami danych w R
nowa_zel[,c(1,3)] #Wybór kolumny, wszystkie woersze i kolumna 1 i 3
nowa_zel[2:100,] #Wybór kolumn od 2 do 100
nowa_zel$Value #Dostajemy ciąg wartości-wektor, a nie ramkę, która była matrycą 
nowa_zel[5,10] #Wybór jednej wartości z jednej kolumny
nowa_zel$Year[30] #Wybór jednej wartości z jednej kolumny z $-30 wartość w kolumnie o nazwie 'Year'

#Zmiana kolumny Value z chr na num
as.numeric(nowa_zel$Value)

#Nowa ramka danych na podstawie nowa_zel
nowa_zela <- nowa_zel

#W ramce danych dokonaj zmiany wartośći value z chr na num
nowa_zela$Value <- as.numeric(nowa_zela$Value)
mean(nowa_zela$Value,na.rn=TRUE) #usuwanie NA

#Tworzenie nowej kolumny dodaj Year do Value
nowa_zela$Suma <- nowa_zela$Year+nowa_zela$Value

#Nowa kolumna logarytm z roku
nowa_zela$Lodarytm <- log(nowa_zela$Year)

'''#usuwanie obiektów
rm(tutaj nazwa)'''

#Nowa ramka danych na podst. nowa_zela bez dodanych kolumn Suma(11) i Lodarytm(12)
nowa_zelan <- nowa_zela[,1:10] #to bierze kolumny w takiej kolejności jak są
nowa_zelan[,c(1,2,5,6,4,7,8,9,10)] #to układa nam kolumny wybrane w takiej kolejności jak chcemy
nowa_zelan[,c("Year","Value")] #pobieranie kolumn po nazwie
