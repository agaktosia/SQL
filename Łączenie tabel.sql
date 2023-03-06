--ŁĄCZENIE TABEL

--INNER JOIN

--Pokaż informację o produktach i nazwy kategorii produktów 
SELECT Produkty.Nazwa, Cena, KategorieProduktow.Nazwa as Kategoria
FROM Produkty
INNER JOIN KategorieProduktow
ON Produkty.IdKategorii = KategorieProduktow.IdKategorieProduktow

--W jakim dziale pracują pracownicy? 
SELECT Imie, Nazwisko, NazwaDzialu
from Pracownicy
INNER JOIN Dzialy
ON Dzialy.IdDzialy = Pracownicy.IdDzialu

--Pokaż klienta i numer jego karty stałego klienta 
SELECT Imie, Nazwisko, NumerKarty
from klienci 
INNER JOIN KartaStalegoKlienta 
ON Klienci.IdKlienci = KartaStalegoKlienta.IdKlienta

--Pokaż nazwę produktu oraz jego ceny i czas ich obowiązywania 
SELECT Nazwa, CenyProduktow.Cena, DataOd, DataDo
FROM Produkty
INNER JOIN CenyProduktow 
on Produkty.Cena = CenyProduktow.Cena


--LEFT I RIGHT JOIN

--Pokaż wszystkich klientów oraz numery karty stałego klienta tylko dla tych, którzy ją posiadają 
SELECT Imie, nazwisko, NumerKarty
From klienci 
LEFT JOIN KartaStalegoKlienta 
ON  Klienci.IdKlienci = KartaStalegoKlienta.IdKlienta

--Pokaż wszystkie zakupy online oraz informację o przyczynie zwrotu dla zwróconych zamówień 
SELECT IdZakupySklepOnline, IdKlienta, DataZakupu, Komentarz, Dostawa, Przyczyna 
from ZakupySklepOnline 
LEFT JOIN Zwroty 
ON ZakupySklepOnline.IdZakupySklepOnline = Zwroty.IdZakupu

--ŁĄCZENIE WIELU TABEL

--Pokaż informacje o zakupach online (id zakupu, datę, nazwę, cenę i ilość kupionych produktów)
SELECT z.IdZakupySklepOnline, z.DataZakupu, p.Nazwa, p.Cena, zp.Ilosc
FROM  Produkty p
INNER JOIN ZakupySklepOnlineProdukt zp
ON zp.IdProduktu = p.IdProdukty 
INNER JOIN ZakupySklepOnline z 
ON z.IdZakupySklepOnline = zp.IdZakupySklepOnlineProdukt

--Pokaż imię i nazwisko pracowników oraz nazwę dostawcy, którego obsługiwał danych pracownik
SELECT p.Imie, p.Nazwisko, dy.Nazwa 
FROM Pracownicy p 
INNER JOIN Dostawa d 
ON d.IdPracownicy = p.IDPracownicy 
INNER JOIN Dostawcy dy 
ON dy.IdDostawcy = d.IdDostawcy

--Z jakich działów pracownicy przyjmowali zwroty? 
SELECT  DISTINCT d.NazwaDzialu
FROM Pracownicy p 
INNER JOIN Dzialy d 
ON d.IdDzialy = p.IdDzialu 
INNER JOIN Zwroty z 
ON z.IdPracownik = p.IdPracownicy

