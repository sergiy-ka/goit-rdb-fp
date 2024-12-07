/*1. Напишіть SQL-запит, який для таблиці orders з атрибута date витягує рік, місяць і число. 
Виведіть на екран їх у три окремі атрибути поряд з атрибутом id та оригінальним атрибутом date (всього вийде 5 атрибутів).*/

use `goit-rdb-hw-03`;

select o.id, o.date, year(o.date) year, month(o.date) month, day(o.date) day
from orders o
;