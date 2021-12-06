# HackerRank-SQL-Solutions
## Description

The solutions of all the SQL challenges for all easy, medium and hard challenges on HackerRank executed on MySQL environment compiled.

## Solutions

## [Basic Select Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=select)

### Revising the Select Query I
```SQL
SELECT * FROM CITY WHERE population > 100000 AND Countrycode ="USA";
```
### Revising the Select Query II
```SQL
Select name from city where population > 120000 and Countrycode = "USA";
```
### Select All
```SQL
Select * from city;
```
### Select by ID
```SQL
select * from city where ID=1661;
```
### Japanese Cities' Attributes
```SQL
select * from city where countrycode="JPN";
```
### Japanese Cities' Names
```SQL
select name from city where CountryCode="JPN";
```
### Weather Observation Station 1
```SQL
select city,State from station;
```
### Weather Observation Station 3
```SQL
Select distinct city from station where ID%2=0;
```
### Weather Observation Station 4
```SQL
select count(city) - count(distinct city) from station;
```
### Weather Observation Station 5
```SQL
select city,length(city) from station order By length(city) asc, city asc limit 1;
select distinct(City),length(city) from station order by length(city) desc, city asc limit 1;
```
### Weather Observation Station 6
```SQL
select distinct city from station where left(city,1) in('a','e','i','o','u');
```
### Weather Observation Station 7
```SQL
select distinct city from station where right(city,1) in('a','e','i','o','u');
```
### Weather Observation Station 8
```SQL
select distinct city from station where left(city,1) in('a','e','i','o','u') and right(city,1) in('a','e','i','o','u') ;
```
### Weather Observation Station 9
```SQL
select distinct city from station where left(city,1) not in('a','e','i','o','u') ;
```
### Weather Observation Station 10
```SQL
select distinct city from station where  right(city,1) not in('a','i','e','o','u') ;
```
### Weather Observation Station 11
```SQL
select distinct city from station where left(city,1) not in('a','i','e','o','u') or right(city,1) not in('a','i','e','o','u');
```
### Weather Observation Station 12
```SQL
select distinct city from station where left(city,1) not in('a','i','e','o','u') and right(city,1) not in('a','i','e','o','u') ;
```
### Higher than 75 marks
```SQL
select name from students where marks > 75 order by right(name,3),id asc;
```
### Employee Names
```SQL
select name from employee order by name;
```
### Employee Salaries
```SQL
select name from employee where salary > 2000 and months <10 order By employee_id;
 ```

## [ Advanced Select Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=advanced-select)

### Type of Triangle
```SQL
Select case 
    when  (A+B<=C or A+C<=B or B+C<=A ) then 'Not A Triangle'
    when (A=B) and(B=C) then 'Equilateral' 
    when (A=B or B=C or A=C)  then 'Isosceles'
    else 'Scalene'
    End as "triangle_type"
    from triangles;
```

### The PADS
```SQL
select CONCAT_WS('',name,'(',left(occupation,1),')')  
    from occupations 
    order by name;

select CONCAT_WS("","There are a total of ",count(occupation)," ",LOWER(occupation),"s.") 
    from occupations 
    group by occupation
    order by count(occupation), occupation; 
```    

### Occupations
```SQL
set @d=0, @p=0, @s=0, @a=0; -- initial counters 

select  min(Doctor), min(Professor), min(Singer), min(Actor)
    from(
        SELECT case
                when Occupation='Doctor' then (@d:=@d+1)
                when Occupation='Professor' then (@p:=@p+1)
                when Occupation='Singer' then (@s:=@s+1)
                when Occupation='Actor' then (@a:=@a+1) end as counter,

            case when Occupation='Doctor' then Name end as Doctor,
            case when Occupation='Professor' then Name end as Professor,
            case when Occupation='Singer' then Name end as Singer,
            case when Occupation='Actor' then Name end as Actor
        FROM OCCUPATIONS order by name )temp
      group by  counter;
```
### Binary Tree Nodes
```SQL
select N,case  
    when P is NULL then 'Root'
    WHEN EXISTS (SELECT B.P FROM BST B WHERE B.P = BT.N) THEN 'Inner'        
    else 'Leaf' end as node_type
    from BST  as BT order by N;
```
### New Companies
- With `left join`. 
    
```SQL

        SELECT
        c.company_code,c.founder,
        count(distinct lm.lead_manager_code),
        count(distinct sm.senior_manager_code),
        count(distinct m.manager_code), 
        count(distinct e.employee_code)
    FROM 
        Company c
        left join Lead_Manager lm on c.company_code=lm.company_code
        left join Senior_Manager sm on sm.lead_manager_code=lm.lead_manager_code
        left join Manager m on m.senior_Manager_code=sm.senior_Manager_code
        left join Employee e on e.manager_code=m.manager_code
    GROUP BY
        c.company_code,c.founder
    ORDER BY 
        c.company_code ASC
```
- Without `left join`
```SQL
    SELECT 
        c.company_code,c.founder,
        count(distinct lm.lead_manager_code),
        count(distinct sm.senior_manager_code),
        count(distinct m.manager_code), 
        count(distinct e.employee_code)
    FROM 
        Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e
    WHERE
        c.company_code=lm.company_code AND
        lm.lead_manager_code=sm.lead_manager_code AND
        sm.senior_manager_code=m.senior_manager_code AND
        m.manager_code=e.manager_code
    GROUP BY 
        c.company_code,c.founder
    ORDER BY 
        c.company_code ASC;
 ```
## [Aggregation Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=aggregation)

### Revising Aggregations - The Sum Function
```SQL
select 
    sum(population) 
from
    city 
where
    district="California";
```
### Revising Aggregations - Averages
```SQL
select 
    avg(population) 
from
    city 
where
    district="California";
```

### Average Population
```SQL
select
    floor(avg(population))
from 
    city;
```

### Japan Population
```SQL
select
    sum(population)
from 
    city
where
    countrycode='JPN';
```

### Population Density Difference
```SQL
select 
    max(population)-min(population)
from 
    city;
```

### The Blunder
```SQL
select 
    ceil(avg(salary)-avg(replace(salary,0,'')))
from 
    employees;
```

### Top Earners
```SQL
select 
    salary*months, COUNT(*)
from 
    employee
where 
    (salary*months) = (select max(salary*months) from employee) 
group by salary*months;
```

### Weather Observation Station 2
```SQL
select 
    round(sum(lat_n),2),round(sum(long_w),2)
from 
    station;
```
### Weather Observation Station 13
```SQL
select 
    truncate(sum(lat_n),4)
from 
    station
where
    lat_n>38.7880 and lat_n<137.2345 ;
```
### Weather Observation Station 14
```SQL
select 
    truncate(max(lat_n),4)
from 
    station
where
    lat_n<137.2345 ;
```

### Weather Oservation Station 15
```SQL
select 
    round(long_w,4) 
from 
    station
where 
    lat_n =(select max(lat_n) from station where lat_n <137.2345);
``` 
### Weather Oservation Station 16
```SQL
select 
    round(min(lat_n),4)
from 
    station
where 
     lat_n>38.7780;
``` 
### Weather Oservation Station 17
```SQL
select 
    round(long_w,4)
from 
    station
where 
     lat_n=(select min(lat_n) from station where lat_n>38.7780);
``` 
### Weather Oservation Station 18
```SQL
select 
    round(abs(max(lat_n)-min(lat_n))+abs(max(long_w)-min(long_w)),4)
from 
    station;
``` 

### Weather Oservation Station 19
```SQL
select 
    round(power((power(max(lat_n)-min(lat_n),2)+power(max(long_w)-min(long_w),2)),0.5),4)
from 
    station;
``` 
### Weather Oservation Station 20

```SQL
set 
    @rownum=0;

SELECT 
    ROUND(t.lat_n, 4)
FROM(
    SELECT 
        s.LAT_N,
        @rownum := @rownum + 1 as `row_number`,
        @total_rows := @rownum
    FROM 
        STATION s
    ORDER BY 
        s.LAT_N
  ) as t
WHERE 
    t.row_number IN (FLOOR((@total_rows + 1) / 2), FLOOR((@total_rows + 2) / 2));
```

## [Basic Join Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=join)[]()

### Population Census
```SQL
select 
    sum(city.population)
from 
    country left join city on city.countrycode=country.code
where 
    country.continent="Asia";
```
### African Cities
```SQL
select 
    city.name
from 
    country inner join city on city.countrycode=country.code
where 
    country.continent="Africa";
```

### Average Population of Each Continent
```SQL
select
    country.continent, floor(avg(city.population))
from
    country inner join city on city.countrycode=country.code
group by
    country.continent
```

### The Report
```SQL
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
```

### 
```SQL

```

### 
```SQL

```

### 
```SQL

```

### 
```SQL

```



## [Advanced Join Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=advanced-join)
Loading ...
## [Alternative Queries Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=alternative-queries)

Loading ...
