# OPERACJE NA ZBIORACH

## UNION 
łączy dwa zapytania, zwraca unikalne dane

## UNION ALL 
zwraca wszystkie dane

```sql
SELECT *
FROM Pracownicy
WHERE PensjaPodstawowa > 3500
     AND Imie LIKE '%a'

UNION 

SELECT *
FROM Pracownicy
WHERE Imie ='Anna'

lub

SELECT *
FROM Pracownicy
WHERE PensjaPodstawowa > 3500
     AND Imie LIKE '%a'

UNION ALL

SELECT *
FROM Pracownicy
WHERE Imie ='Anna'
ORDER BY Nazwisko
```

## INTERSECT 
wyciaga część wspólną, wiersze ktore powtarzają sie w zapytaniach połączonych

## EXCEPT 
zwraca różnice zbiorów

```SQL
SELECT *
FROM Pracownicy
WHERE PensjaPodstawowa > 3500
     AND Imie LIKE '%a'

INTERSECT

SELECT *
FROM Pracownicy
WHERE Imie ='Anna'
ORDER BY Nazwisko
```

```SQL
SELECT *
FROM Pracownicy
WHERE PensjaPodstawowa > 3500
     AND Imie LIKE '%a'

EXCEPT 

SELECT *
FROM Pracownicy
WHERE Imie ='Anna'
ORDER BY Nazwisko
```
## CASE - zwraca warunkowe wartości w kolumnie 
(jeśli warunek jest prawdziwy pojawi się jedna wartość, 
jeśli inny warunek jest prawdziwy pojawi się druga wartość,
w przeciwnym wypadku pojawi się trzecia wartość)

```sql
SELECT Nazwa,
     CASE WHEN cena < 50 THEN 'Tani'
          WHEN cena < 200 THEN 'Drogi'
          ELSE 'Bardzo drogi'
     END AS czyDrogi
FROM Produkty
```