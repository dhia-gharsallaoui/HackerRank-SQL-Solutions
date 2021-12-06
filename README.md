# HackerRank-SQL-Solutions
## Description

The solutions of all the SQL challenges for all easy, medium and hard challenges on HackerRank executed on MySQL environment compiled with helpful Resources & references related to the challenges.

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
Loading ...
## [Basic Join Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=join)[]()
Loading ...
## [Advanced Join Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=advanced-join)
Loading ...
## [Alternative Queries Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=alternative-queries)

Loading ...
