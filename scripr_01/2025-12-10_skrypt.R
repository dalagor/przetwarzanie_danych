library("tidyverse")

#operacje na kolumnach

p <- penguins
#klasyczne podejście
p$bill_len/p$bill_dep #dzielenie kolumn tymczasowe

p[,3]/p[,4]#indeksowanie przez pozycje kolumny w [,x]
p$dzielenie <- p$bill_len/p$bill_dep#przypisać wynik dzielenia do danej kolumny w penguins

#dplyr::mutate()
p <- dplyr::mutate(p,dzielenie_2=bill_len/bill_dep)#przypisanie wyniku dzielenia do danej kolumny w penguins przy pomocy dplyr::mutate()

#mutowanie ramki ze wstawianiem pozycji
p <- dplyr::mutate(p,dodawanie=flipper_len+body_mass,logarytm=log(bill_dep)) #nowa kolumna dodawanie-dodaj flipper_len do body_mass oraz nowa kolumna logarytm z log(bill_dep)

#podglądanie ramki w terminalu
head(p)

p <- dplyr::mutate(p,dodawanie_2=dodawanie+logarytm,.after = species) #dodaj kolumnę "logarytm" do kolumny body_mass po kolumnie body_mass
p <- dplyr::mutate(p,pierwiastek=sqrt(body_mass),.after = species) #dodaj pierwiasrek z kolumny body_mass po kolumnie body_mass

#Mutowanie ramki poprzez funkcję pomocniczą dplyr::across()
#Mutowanie na podstawie nazw
dplyr::mutate(p,dplyr::across(c(bill_len:bill_dep,body_mass),\(x)log(x)))#zlogarytmuj wszystko pomiędzy bill_len, a bill_dep oraz body_mass

#Mutowanie na podstawie cech kolumny
dplyr::mutate(p,dplyr::across(where(\(x) is.numeric(x)),\(x)sqrt(x)))#Policz pierwiastek ze wszystkich kolumn numerycznych

#Mutowanie z porzuceniem
 p <- dplyr::mutate(p,logarytm=log(bill_dep),.keep = "none")#Stwórz kolumnę logarytm na podstawie logarytmu z kolumny bill_dep i użyj argumentu .keep ="none"
#Praca domowa- to co wyżej .keep="none" albo "unused" albo "all"