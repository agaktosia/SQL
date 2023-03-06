--FUNKCJE AGREGUJĄCE, GRUPOWANIE DANYCH, FILTROWANIE GRUP

--Ile jest działów w firmie?
SELECT COUNT(*)
from Dzialy;

--Jaka jest najwyższa kwota zarobków wśród kobiet?
select MAX(PensjaPodstawowa) as NajwyzszaKwotaZarobkow
from Pracownicy
where Right(Imie, 1) ='a'

--Ilu pracowników jest przypisanych do danego przełożonego?
select  IdPrzelozonego, COUNT(*) as Ilosc
from Pracownicy
GROUP by IdPrzelozonego;

--Ilu jest klientów w każdym z wieków?
SELECT wiek, COUNT(*) as ilosc 
from Klienci
group by wiek;

--Ile zwrotów przyjął poszczególny pracownik? 
select IdPracownik, COUNT(*) as Ilosc 
from Zwroty
group by IdPracownik;

--Ile jest produktów w poszczególnych kategoriach?
select IdKategorii, COUNT(*) as ilosc 
from Produkty
GROUP by IdKategorii;

--Jaka jest średnia pensja w poszczególnym dziale?
select IdDzialu, AVG(PensjaPodstawowa) AS Pensja
from Pracownicy
GROUP by IdDzialu;

--Ile zakupów stacjonarnych było w poszczególnym miesiącu
SELECT MONTH(datazakupu) AS miesiac, COUNT(*) as ilosc 
from ZakupySklepStacjonarny
group by MONTH(DataZakupu)

--Ile zakupów online było w poszczególnym dniu miesiąca 
SELECT DAY(DataZakupu) As dzien, MONTH(DataZakupu) AS Miesiac, COUNT(*) as ilosc 
from ZakupySklepOnline
group by DAY(DataZakupu), MONTH(DataZakupu)

--W jakim wieku mamy więcej niż 5 klientów? 
SELECT wiek, COUNT(*) as ilosc 
from Klienci
GROUP by Wiek 
HAVING COUNT(*) > 5

--Pokaż działy w których zarabia się średnio więcej niż 2800zł 
SELECT IdDzialu,AVG(PensjaPodstawowa)  as pensja 
from Pracownicy
GROUP by IdDzialu 
having  AVG(PensjaPodstawowa)  > 2800

--Ilu jest pracowników z przełożonym? 
select COUNT(*) as IloscPracownikow,
COUNT (IdPrzelozonego) as PracownicyzPrzelozonym,
COUNT (*) - COUNT (IdPrzelozonego) as PracownicyBezPrzelozonego
from pracownicy 

SELECT COUNT(IdPrzelozonego)
FROM Pracownicy

SELECT COUNT(*)
FROM Pracownicy
WHERE IdPrzelozonego IS NOT NULL

--Pokaż najtańszą opcje dostawy poza odbiorem osobistym 
select top 1 *
FROM RodzajDostawy 
WHERE nazwa <> 'Odbiór osobisty'
order by cena

--Ilu pracowników jest przypisanych do danego przełożonego? – wyklucz tych bez przełożonego 
SELECT IdPrzelozonego, COUNT(*) AS Ilosc
FROM Pracownicy
WHERE IdPrzelozonego IS NOT NULL
GROUP BY IdPrzelozonego

--Pokaż dni maja w których było sprzedaży w sklepie stacjonarnym co najmniej 5 
SELECT DAY(DataZakupu), COUNT(*) as ilosc 
FROM ZakupySklepStacjonarny
WHERE MONTH(DataZakupu) = 5
group by DAY(DataZakupu)
HAVING COUNT (*) >= 5

--W którym dziale są najwyższe średnie zarobki?
SELECT TOP 1 IdDzialu, CAST(AVG(PensjaPodstawowa) AS decimal(10,2)) AS SrednieZarobki
FROM Pracownicy
GROUP BY IdDzialu
ORDER BY SrednieZarobki DESC

--Pokaż kwartał w którym mieliśmy najwięcej zakupów online 
SELECT TOP 1 DATEPART(QQ, DataZakupu) AS Kwartal, COUNT(*) AS Ilosc
FROM ZakupySklepOnline
GROUP BY DATEPART(QQ, DataZakupu)
ORDER BY Ilosc DESC

--W którym dziale mężczyźni mają najniższe średnie zarobki? 
SELECT TOP 1 IdDzialu, CAST(AVG(PensjaPodstawowa) AS decimal(10,2)) AS SrednieZarobki
FROM Pracownicy
WHERE RIGHT(Imie,1) <> 'a'
GROUP BY IdDzialu
ORDER BY SrednieZarobki

--Za którą dostawę zapłaciliśmy najwięcej? 
SELECT TOP 1 NumerDostawy, SUM(CenaZaSztuke * Ilosc) AS Kwota
FROM DostawaProduktow
GROUP BY NumerDostawy
ORDER BY Kwota DESC

--Znajdź produkty, którym cena zmieniła się więcej niż raz w ciągu miesiąca 
SELECT IdProduktu, MONTH(DataOd), COUNT(*)
FROM CenyProduktow
GROUP BY IdProduktu, MONTH(DataOd)
HAVING COUNT(*) > 1
