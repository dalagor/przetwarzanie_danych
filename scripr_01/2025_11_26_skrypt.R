library(tidyverse)

#Ładowanie danych, które są w R
iris <- iris

dplyr::select(iris,dplyr::starts_with("Pet") & dplyr::contains("dth")) #wybór kolumny zaczynającej się od Pet i zawierającej dth
dplyr::select(iris,dplyr::starts_with("Pet")|dplyr::contains("dth")) #wybór kolumny zaczynającej się od Pet lub zawierającej dth

#Star Wars
sw <- dplyr::starwars

#Wybór kolumny po typie danych z anonimową funkcją
dplyr::select(sw,dplyr::where(\(x) is.numeric(x))) #Wybór kolumn numerycznej (x możemy zamienić na kolumne lub co kolwiek innego, definiowanie małej zmiennej tymczasowej)
dplyr::select(sw,dplyr::where(\(x) is.character(x))& dplyr::contains("r")) #Wybór kolumn tekstowych, które zawierają r
dplyr::select(sw,dplyr::where(\(x) is.numeric(x) & mean(x, na.rm=TRUE)>(100))) #Wybór kolumny numerycznej, której średnia jest większa niż 100
dplyr::select(sw,dplyr::contains("r")& dplyr::where(\(x) is.numeric(x)& mean(x, na.rm=TRUE)>1& mean(x,na.rm=TRUE)<100))#Wybór kolumny, która zawiera w nazwie literę "r", jest kolumną numeryczną i jej średnia jest pomiędzy 1, a 100

#Wybór wierszy przez filter
dplyr::filter(sw,height==182) #Filtrowanie przez spełnienie warunku
dplyr::filter(sw, height > 70) #Filtorwanie przez spełnienie jednego warunku więcej niż 70 cm
dplyr::filter(sw, height <= 70)#Filtorwanie przez spełnienie jednego warunku mniej i równe 70 cm
dplyr::filter(sw, height < 70|height> 200)# Filtrowanie przez spełnienie warunku mniej niż 70cm oraz więcej niż 200cm
