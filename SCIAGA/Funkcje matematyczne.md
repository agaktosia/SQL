# Funkcje matematyczne

## ROUND 

Zaokrągla wartości, nie zmienia typu danych.

```sql
SELECT ROUND (1.1255,2)
```
Wynik 1.1300 

2 po przecinku, wskazuje ile miejsc po przecinku chcemy zaokrąglić.

```sql
SELECT ROUND(21.496347,1)
```
Wynik 21.500000

## FLOOR

Zaokrągla w dół.

```sql
SELECT FLOOR (3.9999) AS wDol
```
Wynik 3.

## CELING 

Zaokrągla w górę.

```sql
SELECT CELINK(3.0002) AS wGore
```
Wynik 4.

## POWER

Potęgowanie

```sql
SELECT POWER (2,6) AS Potegowanie
```
Wynik 64. 

2 - liczba, którą potęgujemy
6 - jaka potęga

## SQRT 

Pierwiastek kwadratowy drugiego stopnia.

```sql
SELECT SQRT(16) As Pierwiastek 
```
Wynik 4.

## PI

Liczba PI.

```sql
SELECT PI() As liczba PI
```

Wynik 3,141592.....