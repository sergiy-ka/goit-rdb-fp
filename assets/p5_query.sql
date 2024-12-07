/*5. Напишіть SQL-запит, який для таблиці orders виводить на екран атрибут id, атрибут date та JSON-об’єкт {"id": <атрибут id рядка>, "date": <атрибут date рядка>}. 
Для створення JSON-об’єкта використайте функцію.*/

use `goit-rdb-hw-03`;

select o.id, o.date, json_object('id', o.id, 'date', o.date)
from orders o
;