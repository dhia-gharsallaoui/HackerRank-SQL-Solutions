-- Population Census
select 
    sum(city.population)
from 
    country left join city on city.countrycode=country.code
where 
    country.continent="Asia";

-- African Cities
select 
    city.name
from 
    country inner join city on city.countrycode=country.code
where 
    country.continent="Africa";

-- Average Population of Each Continent
select
    country.continent, floor(avg(city.population))
from
    country inner join city on city.countrycode=country.code
group by
    country.continent

--The Report
select 
    case when g.grade<8 then NULL
    else s.name end as names,
    g.grade,s.marks
from 
    students s join grades g on s.marks between g.min_mark and g.max_mark
order by   
    g.grade Desc,
    s.name,
    s.marks;