
--FILTROWANIE I SORTOWANIE

--Pokaż pracowników zatrudnionych w latach 2010-2015
select *
from Pracownicy
where DataZatrudnienia BETWEEN '2010-01-01' and '2015-12-31';

--Pokaż pracowników o imionach Anna, Tomasz i Kamila
select *
FROM Pracownicy
where Imie in ('Anna', 'Tomasz','Kamila');

--Pokaż zakupy online zwierające komentarz
select *
FROM ZakupySklepOnline
where Komentarz <> '';

--Pokaż pracowników zarabiających poniżej 2000zł, którzy posiadają przełożonego
select *
FROM Pracownicy
where PensjaPodstawowa < 2000 and IdPrzelozonego is not NULL;

	
--Pokaż imię, nazwisko i datę zatrudnienia Natalii Rebuś
select imie, Nazwisko, DataZatrudnienia
FROM Pracownicy
where Imie = 'Natalia' and Nazwisko = 'Rebuś';

--Pokaż zakupy online z marca 2020 roku
select *
from ZakupySklepOnline
where DataZakupu BETWEEN '2020-03-01' and '2020-03-31';

--Pokaż zakupy z pierwszej połowy 2020 roku
select *
from ZakupySklepOnline
where DataZakupu BETWEEN '2020-01-01' and '2020-06-30';

	
--Pokaż dostawców spoza Wrocławia
select *
from Dostawcy
where miasto not like 'Wroc_aw';

--Pokaż wszystkie produkty związane ze Star Wars
select *
FROM Produkty
where Nazwa like '%Star Wars%';

--Pokaż wszystkie body Nikona
select *
from Produkty
where Nazwa like 'NIKON%BODY%';

--Pokaż Canony z serii D (np. 6D, 77D) droższe niż 5000zł
select *
FROM Produkty
where Nazwa like '%Canon%[0-9]D%' and cena > 5000;

--Pokaż produkty Star Wars nie będące klockami LEGO
select *
from Produkty
where nazwa like '%star wars%' and nazwa not like '%klocki%';

--Pokaż kobiety zatrudnione po 1 stycznia 2010 roku
select *
FROM Pracownicy
where imie like '%a' and DataZatrudnienia > '2010-01-01';

--Pokaż imiona i nazwiska mężczyzn zatrudnionych w latach 2011-2016
select *
from Pracownicy
where imie not like '%a' and DataZatrudnienia BETWEEN '2011-01-01' and '2016-12-31';

--Pokaż nazwy wszystkiego co kosztuje poniżej 100zł i nie jest klockami LEGO
select *
from Produkty
where cena < 100 and nazwa not like '%Lego%';

--Pokaż pracowników posortowanych wg daty zatrudnienia
select *
from Pracownicy
ORDER by DataZatrudnienia;

	
--Pokaż imiona i nazwiska pracowników posortowanych wg pensji  
select imie, nazwisko
from Pracownicy
ORDER by PensjaPodstawowa;

	
--Pokaż wszystkie Anny posortowane malejąco wg nazwiska
select *
from Pracownicy
where imie like 'Anna'
ORDER by nazwisko DESC;

--Pokaż 4 najtańsze produkty w kategorii nr 2
select top 4*
from Produkty
where IdKategorii = 2
order by cena;

--Pokaż 2 najtańsze zestawy klocków lego
SELECT top 2 *
from Produkty
where nazwa like '%lego%'
order by cena;

--Pokaż najdroższy produkt Apple
select top 1*
from Produkty
where nazwa like '%Apple%'
ORDER by cena DESC;

--Pokaż 3 najdroższe Nikony serii D
select top 3*
from Produkty
where nazwa like 'Nikon%D[0-9]%'
ORDER by cena DESC;

--Posortuj alfabetycznie produkty Star Wars
select *
from Produkty
where nazwa like '%star wars%'
ORDER by Nazwa;

	
--Pokaż 3 kobiety zarabiające co najmniej 3000zł
select top 3*
from Pracownicy
where imie like'%a' and PensjaPodstawowa > = 3000;

--Pokaż najtańsze body Nikona
select top 1*
from Produkty
where nazwa like '%Nikon%BODY%' 
ORDER by cena;

--Pokaż produkty mające moc pomiędzy 500, a 880 wat (np. Kuchenka mikrofalowa 800W)
select *
from Produkty
where nazwa like '%[^0-9][5-8][0-8][0-9]W%';


--Pokaż imię, nazwisko oraz informację o zarobkach mężczyzn zarabiających powyżej 3000zł lub posiadających co najmniej 20% premii (w tabeli ponade jest 20 jako 20%)
select Imie, Nazwisko, PensjaPodstawowa, Premia
from Pracownicy
where imie not like '%a' and PensjaPodstawowa > 3000 or Premia > = 20;

--Pokaż najdroższy produkt Canona, nie będący BODY
select top 1*
from Produkty
where nazwa like '%Canon%' and nazwa not like '%Body%'
order by cena desc;

	
--Pokaż produkty nie będące klockami Lego, chyba, że to zestaw związany ze Star Wars w przedziale 50-100zł
select *
from Produkty
where (nazwa not like '%LEGO%' or nazwa like '%star wars%') and cena BETWEEN 50 and 100;

--Pokaż mikrofalówki mające co najmniej 850W mocy
select *
from Produkty
where nazwa like 'Kuchenka mikrofalowa%[8-9][5-9][0-9]W%';
