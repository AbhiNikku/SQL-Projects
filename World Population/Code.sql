Create table population(
country Varchar(50),
area INT,
birth_rate INT,
death_rate INT,
infant_mortality_rate INT,
internet_users INT,
life_exp_at_birth INT,
maternal_mortality_rate INT,
net_migration_rate INT,
population INT,
population_growth_rate INT
);

Alter Table Population rename column  "population_growth_rate(%)" to population_growth_rate;

Select * from population;

--Which country has the highest population?
Select * from (
Select Country, Population, dense_rank() over(order by Population desc) as Ranking
from population)
where Ranking = 1;

--Which country has the least number of people?
Select * from (
Select Country, Population, dense_rank() over(order by Population asc) as Ranking
from population)
where Ranking = 2;

--Which country is witnessing the highest population growth?
Select * from (
Select Country, Population,population_growth_rate , dense_rank() over(order by population_growth_rate desc) as Growth_Ranking
from population)
where Growth_Ranking = 1;

 --Which is the most densely populated country in the world?
Select * from (
Select Country, Population,area ,(Population/area) as Population_Density, dense_rank() over(order by Population_Density desc) as Density_Ranking
from population where area > 0)
where Density_Ranking = 1;
