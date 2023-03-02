--POBIERANIE DANYCH

--Pokaż wszystkich pracowników
select *
from Pracownicy;

--Pokaż wszystkie działy
select *
from Dzialy;

--Pokaż wszystkich dostawców
select *
from Dostawcy;

--Pokaż imiona i nazwiska pracowników
select imie, nazwisko
from Pracownicy;

--Pokaż nazwy i ceny produktów
select nazwa, cena
from Produkty;

--Pokaż jednego pracownika
select top 1*
from Pracownicy;

--Pokaż trzy produkty
select top 3*
from Produkty;

--Pokaż unikalne imiona pracowników
select distinct Imie
from Pracownicy;

--Pokaż dwie nazwy kategorii produktów
select top 2 Nazwa
from KategorieProduktow;

--Pokaż pracowników o imieniu Anna
select *
from Pracownicy
where imie = 'Anna';

--Pokaż adres firmy Jubiler Andrzej
select Adres
from Dostawcy
where Nazwa ='Jubiler Andrzej';

--Pokaż cenę Samsunga S9
select cena
from Produkty
where Nazwa ='Samsung S9';

--Pokaż wszystkie dostawy z 5 grudnia 2020 roku
select *
from Dostawa
where DataDostawy= '2020-12-05';

--Pokaż wszystkie styczniowe dostawy
select *
from Dostawa
where DataDostawy <= '2020-01-31';

--Pokaż imiona i nazwiska pracowników zarabiających więcej niż 4000zł
select imie, nazwisko
from Pracownicy
where PensjaPodstawowa > 4000;

--Pokaż jednego pracownika zatrudnionego 1 stycznia 2020 roku
select top 1*
from Pracownicy
where DataZatrudnienia = '2020-01-01';

--Pokaż produkty kosztujące pomiędzy 1000, a 3000 złotych
select *
from Produkty
where Cena BETWEEN 1000 and 3000;

--Pokaż pracowników nie posiadających przełożonego
select *
from Pracownicy
where IdPrzelozonego is NULL;

--Pokaż produkty Samsunga
select *
from Produkty
where nazwa like 'Samsung%';

--Pokaż wszystkie produkty LEGO
select *
from Produkty
where nazwa like '%Lego%';

--Pokaż nazwy Hot Wheelsów posortowanych alfabetycznie
select Nazwa
from Produkty
where Nazwa like 'Hot Weels%'
order by Nazwa;

--Pokaż 3 najdroższe produkty
select TOP 3*
from Produkty
order by cena DESC;
