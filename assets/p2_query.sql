/*2. Напишіть SQL-запит, який для таблиці orders до атрибута date додає один день. 
На екран виведіть атрибут id, оригінальний атрибут date та результат додавання.*/

use `goit-rdb-hw-03`;

select o.id, o.date, date_add(o.date, interval 1 day) date_add_1day
from orders o
;