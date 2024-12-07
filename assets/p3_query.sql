/*3.*/

use pandemic;

select 
    e.entity,
    e.code,
    round(avg(cast(ico.number_rabies as decimal(10,2))), 2) as avg_rabies,
    min(cast(ico.number_rabies as decimal(10,2))) as min_rabies,
    max(cast(ico.number_rabies as decimal(10,2))) as max_rabies,
    round(sum(cast(ico.number_rabies as decimal(10,2))), 2) as sum_rabies
from infectious_cases_opt ico
join entity e on ico.entity_id = e.id
where ico.number_rabies != '' 
    and ico.number_rabies is not null
group by e.entity, e.code
order by avg_rabies desc
limit 10;