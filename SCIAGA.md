# FUNKCJE TESTOWE

## CONCAT 

scala/skleja tekst (jeśli coś nie jest tekstem, zamienia na tekst), np
```sql
SELECT CONCAT(Imie, ' ', Nazwisko)
```

## RIGHT I LEFT
 
 Dzięki temu warunkowi wyciągniemy - imiona kobiet kończące się na "a" 
 (w Polsce, imiona kobiet kończą się na "a", z jednym wyjątkiem).

 ```sql
 WHERE RIGHT(Imie, 1) = 'a'
 ```

W powyższym przykładzie 1 wskazuje - ile znaków chcemy wyciągnąć, RIGHT - wskazuje, z której strony.
 
Dzięki temu zapytaniu wyciągniemy - wszystkie imiona rozpoczynające się na "K".
 
 ```sql
 WHERE LEFT(Imie, 1) = 'K'
 ```
 
 W powyższym przykładzie 1 wskazuje - ile znaków chcemy wyciągnąć, LEFT - wskazuje, z której strony.
    
 
## SUBSTRING 

(może mieć różne skróty - MID, SUB, SUBR)
 
Wyciąga nam znaki ze środka tekstu.

```sql 
SELECT SUBSTRING(PESEL, 5, 2) 
```

Pierwsza wartość w nawiasie wskazuje, z której kolumny tabeli chcemy coś wyciągnąć; 
5 wskazuje, od którego znaku chcemy zacząć, a 2 wskazuje ile znaków chcemy wyciągnąć.
  
### LEN
  
Służy do liczenia znaków w teksie.
  
```sql
WHERE LEN(PESEL) <> 11
```

Zapytanie pomoże wskazać błędy w kolumnie PESEL, gdyż zwróci nam PEELE, 
których ilość znaków jest różna od 11 (PESEL w Polsce ma 11 znaków).
                               
