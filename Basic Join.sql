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

-- Top Competitors
select
  h.hacker_id,h.name
from 
    submissions s join hackers h on s.hacker_id=h.hacker_id
    join challenges c on c.challenge_id=s.challenge_id
    join difficulty d on c.difficulty_level=d.difficulty_level and s.score=d.Score
group by 
    h.hacker_id,h.name
having count(h.hacker_id) > 1 
order by 
    count(h.hacker_id) desc,
    h.hacker_id ;

-- Ollivander's Inventory
select
    w.id,wp.age,w.coins_needed,w.power
from 
    wands w join wands_property wp on w.code=wp.code
where 
    wp.is_evil=0 and 
    w.coins_needed=(select 
                        min(w2.coins_needed)
                    from 
                        wands w2 join wands_property wp2 on w2.code=wp2.code
                    where 
                        w2.power=w.power and wp2.age=wp.age)
order by
    w.power desc,
    wp.age desc;
