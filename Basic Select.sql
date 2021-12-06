-- Revising the Select Query I
SELECT * FROM CITY WHERE population > 100000 AND Countrycode ="USA";

-- Revising the Select Query II
Select name from city where population > 120000 and Countrycode = "USA";

-- Select All
Select * from city;

-- Select by ID
select * from city where ID=1661;

-- Japanese Cities' Attributes
select * from city where countrycode="JPN";

-- Japanese Cities' Names
select name from city where CountryCode="JPN";

-- Weather Observation Station 1
select city,State from station;

-- Weather Observation Station 3
Select distinct city from station where ID%2=0;

-- Weather Observation Station 4
select count(city) - count(distinct city) from station;

-- Weather Observation Station 5
select city,length(city) from station order By length(city) asc, city asc limit 1;
select distinct(City),length(city) from station order by length(city) desc, city asc limit 1;

-- Weather Observation Station 6
select distinct city from station where left(city,1) in('a','e','i','o','u');

-- Weather Observation Station 7
select distinct city from station where right(city,1) in('a','e','i','o','u');

-- Weather Observation Station 8
select distinct city from station where left(city,1) in('a','e','i','o','u') and right(city,1) in('a','e','i','o','u') ;

-- Weather Observation Station 9
select distinct city from station where left(city,1) not in('a','e','i','o','u') ;

-- Weather Observation Station 10
select distinct city from station where  right(city,1) not in('a','i','e','o','u') ;

-- Weather Observation Station 11
select distinct city from station where left(city,1) not in('a','i','e','o','u') or right(city,1) not in('a','i','e','o','u');

-- Weather Observation Station 12
select distinct city from station where left(city,1) not in('a','i','e','o','u') and right(city,1) not in('a','i','e','o','u') ;

--Higher than 75 marks
select name from students where marks > 75 order by right(name,3),id asc;

--Employee Names
select name from employee order by name;

--Employee Salaries
select name from employee where salary > 2000 and months <10 order By employee_id;
