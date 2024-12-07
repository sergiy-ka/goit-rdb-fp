/*4. Напишіть SQL-запит, який рахує, скільки таблиця orders містить рядків з атрибутом date у межах між 1996-07-10 00:00:00 та 1996-10-08 00:00:00.*/

use `goit-rdb-hw-03`;

select count(o.id) count_order
from orders o
where o.date between convert("1996-07-10 00:00:00", datetime) and convert("1996-10-08 00:00:00", datetime)
;