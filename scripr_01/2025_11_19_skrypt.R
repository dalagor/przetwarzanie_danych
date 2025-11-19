library("tidyverse")

#Ładowanie danych, które są w R
iris <- iris
 
#średnia długość płatka
srednia_platka <- mean(iris$Petal.Length)

#mediana z szerokości sepal
mediana_szerokosci <- median(iris[,2])
mediana_szerokosci

#średnia długość dla płatka setosa(jeden z gatunków)
srednia_setosa <- mean(iris[1:50,3])
srednia_setosa

#srednia setosa w inny, bardziej flexibility sposób
setos_sternia <- mean(iris[iris$Species=="setosa",3]) #w ramce iris wybierz wiersze o wartości "setosa" i pobierz dane z trzeciej kolumny
setos_sternia

srednia_setosa==setos_sternia #sprawdzenie, czy jedno jest równe drugiemu (TRUE=prawda)

#Podsumowanie danch
summary(iris)

#Nowa ramka danych + wynik działania dodawania
iris2 <- iris
iris2$nowa_kolumna <- iris$Sepal.Length+iris$Sepal.Width

#Początek pracy z dplyr
#Funkcja select-wybór kolumn
dplyr::select(iris,Species) #wybierz za pomocą nazwy, wybór kolumny Species z ramki danych iris
dplyr::select(iris,c(Sepal.Length,Petal.Length))#wywoływanie więcej niż jednej kolumny w klasyczny sposób
dplyr::select(iris,Sepal.Length,Petal.Length)#wywoływanie więcej niż jednej kolumny szybciej
dplyr::select(iris,Species,Petal.Length,Sepal.Length)#zmiana kolejności
'''dplyr::select(iris,Species,Petal.Length,Sepal.Length,Petal.Length)#prezentacja dupochronu, że nie wyrzuci nam dwa razy tej samej kolumny'''
dplyr::select(iris,-Species) #wszystko poza daną kolumną, w tym przypadku: Species

dplyr::select(iris,dplyr::contains(match="Petal"))#wybór wszystkiego co dotyczy Petal (taki Ctrl+F)
dplyr::select(iris,dplyr::contains(match="."))#wybór wszystkiego co ma '.' (taki Ctrl+F)
dplyr::select(iris,dplyr::starts_with("Pet"))#zaczyna się na 'Pet'...
dplyr::select(iris,dplyr::ends_with("th"))#kończy się z 'th'...
dplyr::select(iris,dplyr::starts_with("Pet"),ends_with("dth"))#wszystkie kolumny zaczynające się na 'Pet' i kończące się na 'dth', wybór wszystkiego co spełnia w jakikolwiek sposób ten warunek
dplyr::select(iris,dplyr::starts_with("Pet") & ends_with("dth"))#Tylko te kolumny które zawierają obydwa warunki:zaczynające się na 'Pet' i kończące się na 'dth'
dplyr::select(iris,-dplyr::starts_with("Sep")) #wybierz wszystko poza tym co zawiera "Sep"
dplyr::select(iris,!dplyr::starts_with("Sep")) #wybierz nie(!)-nie wybieraj "Sep"