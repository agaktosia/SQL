-- MODYFIKACJA DANYCH

-- Wstawianie danych

--Dodaj klienta
INSERT INTO Klienci(Imie, Nazwisko, Wiek)
VALUES ('Krystyna', 'Jankowiak', 30);

--Dodaj do sklepu nowy produkt z telefonem, którego używasz
INSERT INTO Produkty(Nazwa, Cena, IdKategorii)
VALUES('Samsung S10+', 4400, (SELECT IdKategorieProduktow FROM KategorieProduktow WHERE Nazwa = 'Telefony'));

-- Aktualizacja danych

--Usuń komentarz do zamówienia online nr 311
UPDATE ZakupySklepOnline
SET Komentarz = ''
WHERE IdZakupySklepOnline = 311;

--Ustaw cenę iPhone X jako średnią cenę wszystkich iPhone
UPDATE Produkty
SET Cena = (SELECT AVG(Cena) FROM Produkty WHERE Nazwa LIKE '%iPhone%')
WHERE Nazwa = 'Apple iPhone X';

--Usuń całe zamówienie online nr 255
DELETE FROM ZakupySklepOnlineProdukt
WHERE IdZakup = 255

DELETE FROM ZakupySklepOnline
WHERE IdZakupySklepOnline = 255;