#OPERACJE NA ZBIORACH

##UNION - łączy dwa zapytania, zwraca unikalne dane

##UNION ALL - zwraca wszystkie dane

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

##INTERSECT - wyciaga część wspólną, wiersze ktore powtarzają sie w zapytaniach połączonych

##EXCEPT - zwraca różnice zbiorów

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
