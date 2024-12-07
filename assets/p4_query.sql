/*4.*/

use pandemic;

with datecalculations as (
    select 
        ico.id,
        ico.year,
        makedate(ico.year, 1) as first_day_of_year,
        current_date() as current_system_date
    from infectious_cases_opt ico
)
select *, timestampdiff(year, first_day_of_year, current_system_date) as years_difference
from datecalculations;