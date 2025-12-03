library("tidyverse")

sw <- dplyr::starwars

#Filtrowanie z negacją
dplyr::filter(sw, !height > 200 & !mass<100)

#Filtrowanie przedziału wzrostu między 80 i 120 na dwa różne sposoby
dplyr::filter(sw, height >80&height< 120)
dplyr::filter(sw,dplyr::between(height,80,120))

#Kolor postaci brown & white
'''dplyr::filter(sw,skin_color==c("brown", "white")) #daje błąd jakiś'''
dplyr::filter(sw,skin_color%in%c("brown", "white")) #wybierz wszystko to co jest w wektorze i jest "brown" lub "white"

#Definiujemy wektor z interesującymi nas kolorami
col <- c("brown","white")
#Przefiltruj ramkę na podstawie kolory(col)
dplyr::filter(sw,skin_color%in%col)
#Zmiana nazwy i przenoszenie kolumn ----
##Zmiana nazwy----

#dplyr::rename()
#Nowy dataset pingwiny
p <- penguins

p <- dplyr::rename(p,flipper=flipper_len)#Zmiana nazwy jednej kolumny
p <- dplyr::rename(p,dlugosc_dzioba=bill_len,wyspa=island)#zmiana więcej niż jednej kolumny po pl: długość dzioba i wyspa w jednej funkcji)

#Zmiana za pomocą funkcji
#dplyr::rename_with()

p <- dplyr::rename_with(p,\(x)toupper(x)) #Zmiana wszystkich kolumn na pisane wielką literą
p <- dplyr::rename_with(p,\(x)tolower(x),c(SPECIES,WYSPA,DLUGOSC_DZIOBA)) #Zmiana wybranych 3 kolumn spowrotwm na małe litery: species, wyspa i dł. dzioba
p <- dplyr::rename_with(p,\(x)tolower(x),dplyr::where(\(x) is.numeric(x))) #Zmiana nazwy kolumn numerycznych na małe litery

#Przenoszenie kolumny----
#dplyr::relocate()

p <- dplyr::relocate(p,dlugosc_dzioba,.before = wyspa)#przenosimy długość dzioba przed wyspę
p <- dplyr::relocate(p, dplyr::contains("e"),.after = species)#przenosimy wszystkie kolumny zawierające w nazwie "e" po kolumnie gatunek

nazwy <- colnames(p)
nazwy_ord <- order(nazwy)
p <- dplyr::select(p,order(colnames(p)))#segregacja kolumn po nazwach alfabetycznie