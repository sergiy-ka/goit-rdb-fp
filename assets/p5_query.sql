/*5.*/

use pandemic;

delimiter //

create function calculate_years_difference(input_year int) 
returns int
deterministic
begin
    return timestampdiff(
        year, 
        makedate(input_year, 1), 
        current_date()
    );
end //

delimiter ;

select 
    ico.id,
    ico.year,
    makedate(ico.year, 1) as first_day_of_year,
	current_date() as current_system_date,
    calculate_years_difference(ico.year) as years_difference
from infectious_cases_opt ico;