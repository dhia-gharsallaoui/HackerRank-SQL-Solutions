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

-- Challenges
select 
    h.hacker_id,h.name,count(h.hacker_id) as challenges_created
from 
    hackers h join challenges c on h.hacker_id=c.hacker_id
group by
    h.hacker_id,
    h.name
having 

    challenges_created=(
    select 
        count(challenge_id) as max_challenges 
    from
        challenges 
    group by 
        hacker_id
    order by 
        max_challenges desc 
    limit 1 ) 
    or
    challenges_created in(
    select 
        temp.max_challenges 
    from 
        (select  count(challenge_id) AS max_challenges
    FROM 
         challenges
    group by 
         hacker_id order by max_challenges) temp 
    group by 
        temp.max_challenges
    having 
        count(temp.max_challenges)=1)

order by 
    challenges_created desc,
    h.hacker_id
  
-- Contest Leaderboard
select 
    h.hacker_id,h.name,sum(ss.max_score) as total_score
from 
    hackers h join (select 
                        s.hacker_id,s.challenge_id,max(score) as max_score
                    from 
                        submissions s
                    group by 
                        s.hacker_id,s.challenge_id) ss
                    on h.hacker_id=ss.hacker_id
group by 
    h.hacker_id,h.name
having
    total_score>0
order by
    total_score desc,
    h.hacker_id