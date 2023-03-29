## FUNKCJE DATY I CZASU

### MONTH 

Przykład zwróci dostawy z lipca i sierpnia.

```sql
SELECT *
FROM Dostawa
WHERE MONTH (DataDostawy) IN (7,8)
```
### GETDATE

Zwróci bieżącą datę i godzinę.

```sql
SELECT *
FROM Dostawa
WHERE DataDostawy > GETDATE ()
```
### DATEPART

Zwróci np. dzień tygodnia w tym przypadku poniedziałek (1).

```sql
SELECT *
FROM ZakupySklepOnline
WHERE DATEPART (DW. DataZakupu) = 1
```
### DATEADD

Pozwala przesunąć datę o wyznaczony interwał np. datę za 14 dni, czyli datę ewentualnego zwrotu zamówienia.

```sql
SELECT DataZakupu
DATEADD (DD, 14, DataZakupu) AS mozliwyZwrot
FROM ZakupySklepOnline
```
### DATEDIFF

Zwraca czas między dwoma datami.

```sql
SELECT DataZakupu
DATEDIFF (DD, DataZakupu, GETDATE())
FROM ZakupySklepOnline
```


