--FUNKCJE

--Pokaż imię, nazwisko i rok urodzenia pracownika (zakładamy, że każdy urodził się w XX wieku)
select imie, nazwisko, '19' + LEFT(PESEL,2)
from Pracownicy
where LEN(PESEL) = 11;

--Pokaż imiona i nazwiska kobiet (nie korzystając z LIKE) w formie “Pani Janina Nowakowska”
select 'Pani ' + imie + ' ' + nazwisko
from Pracownicy
where RIGHT(imie,1)='a';

--Zaokrąglij liczbę PI do 4 miejsc po przecinku
select  ROUND(PI(), 4);

--Znajdź zakupy zrobione w nocy (pomiędzy północą, a piątą rano)
select *
FROM ZakupySklepOnline
where DATEPART(HH, DataZakupu) BETWEEN 0 and 5;

--Ile tygodni minęło od Twojego urodzenia?
select DATEDIFF (WK, '1975-05-26', Getdate());

--Wyświetl nazwę i cenę produktu w formie kwoty (dwa miejsca po przecinku)
select nazwa, cast (cena as decimal (10,2)) as Cena 
from Produkty;

--Pokaż imiona, nazwiska i nr PESEL pracowników tylko z poprawnej długości 
--PESELem, a jeśli nie ma podanego PESELu pokaż taką informację
select imie, nazwisko, ISNULL (PESEL, 'Brak peselu') as PESEL
from Pracownicy
where LEN(PESEL) =11 or PESEL is NULL;

--	Pokaż pracowników urodzonych w latach 80tych (bez użycia LIKE)
select *
from Pracownicy
where LEFT(PESEL, 1) = '8';

--Pokaż inicjały pracowników
select LEFT(imie, 1) + LEFT(nazwisko,1) as inicjaly
from Pracownicy;

--Pokaż zakupy zrobione w weekend
select *
FROM ZakupySklepOnline
where DATEPART(DW, DataZakupu) IN (7,1);
