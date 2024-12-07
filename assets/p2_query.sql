/*2.*/

use pandemic;

create table `entity` (
  `id` int not null auto_increment,
  `entity` varchar(100) not null,
  `code` varchar(50),
  primary key (`id`)
) engine=innodb auto_increment=3 default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

create table `infectious_cases_opt` (
  `id` int not null auto_increment,
  `entity_id` int not null,
  `year` int not null,
  `number_yaws` text default null,
  `polio_cases` text default null,
  `cases_guinea_worm` text default null,
  `number_rabies` text default null,
  `number_malaria` text default null,
  `number_hiv` text default null,
  `number_tuberculosis` text default null,
  `number_smallpox` text default null,
  `number_cholera_cases` text default null,
  primary key (`id`),
  key `entity_id` (`entity_id`),
  constraint `infectious_cases_opt_ibfk_1` foreign key (`entity_id`) references `entity` (`id`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

insert into entity (entity, code)
select distinct entity, code 
from infectious_cases 
where entity is not null
order by entity;

insert into infectious_cases_opt (
    entity_id,
    year,
    number_yaws,
    polio_cases,
    cases_guinea_worm,
    number_rabies,
    number_malaria,
    number_hiv,
    number_tuberculosis,
    number_smallpox,
    number_cholera_cases
)
select 
    e.id as entity_id,
    ic.year,
    ic.number_yaws,
    ic.polio_cases,
    ic.cases_guinea_worm,
    ic.number_rabies,
    ic.number_malaria,
    ic.number_hiv,
    ic.number_tuberculosis,
    ic.number_smallpox,
    ic.number_cholera_cases
from infectious_cases ic
join entity e on ic.entity = e.entity and ic.code = e.code
where ic.year is not null
order by e.id, ic.year;

select * from infectious_cases_opt;