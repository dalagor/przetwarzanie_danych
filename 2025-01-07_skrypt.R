library("tidyverse")
library(readxl)

# Wczytywanie plku
'''plik <- read_excel("data_msu.xlsx") #wczytuje się cała ramka'''

plik <- "data_msu.xlsx" #wczytywanie po ścieżce do pliku

readxl::excel_sheets("data_msu.xlsx")
readxl::excel_sheets(plik) 
data_loi <- readxl::read_excel(plik, sheet="loi")
data_elem <- readxl::read_excel(plik, sheet="elemental")
data_bsi <- readxl::read_excel(plik, sheet="bsi")

#łączenie elementów w lewo
dane_01 <- dplyr::left_join(data_loi, data_elem) #dołącz dane elementarne do loi - dołączenie w lewą strone (data_loi <- data_elem)
dane_02 <- dplyr::left_join(data_bsi, data_loi)#próba dołączenia data_loi do data_bsi, problem ->Joining with `by = join_by(sample_id, mass_mg), gdzie mass_mg jest masą próbki, która nie definiuje jednoznacznie próbki
dane_03 <- dplyr::left_join(data_bsi, data_loi, by=dplyr::join_by(sample_id)) #wskazanie, żeby elementy łączyły się tylko i wyłącznie na podstawwie sample_id (z racji, że były w obydwy arkuszach kolumny mass_mg, to jakonowe przypisanie pojawiły się dwie nowe kolumny mass_mg - jedna x(należąca do lewego przypisu), druga y(do prawego)))

#zmień nazwę kolumny  sample_id w ramce data_elem na próbka id
data_elem <- dplyr::rename(data_elem,probka_id=sample_id)
#połącz ramki danych data_bsi oraz data_elem na podstawie sample_id oraz próbka_id
dplyr::left_join(data_elem,data_bsi,by=dplyr::join_by(probka_id==sample_id))#lewopołączenie z dopasowaniem nazwy, ponieważ kolumny mają inne nazwy (nie takie same)

#inner join- "restyrykcyjne" łączenie, tylko część wspólna w x i y
dane_04 <- dplyr::inner_join(data_bsi, data_loi, by=dplyr::join_by(sample_id))

#Full join- łączenie wszystkiego jak leci po kluczach
dane_05 <- dplyr::full_join(data_elem,data_bsi, by = join_by(probka_id==sample_id)) #data_bsi z data_elem,
dane_05 <- dplyr::full_join(dane_05, data_loi)  #potem do wyniku dołączamy data_loi

#Łączenie filtrujące semi join-zachowaj wiersze w x, które są takie same jak w y
dane_06 <- dplyr::semi_join(data_bsi,data_loi, join_by(sample_id))

#Łączenie filtrujące anty_join-zachowaj wiersze w x, które nie mają odpowiednika w y
dane_07 <- dplyr::anti_join(data_elem, data_bsi, by =dplyr::join_by(probka_id==sample_id))

