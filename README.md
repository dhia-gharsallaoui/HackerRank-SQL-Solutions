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

## [Aggregation Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=aggregation)
Loading ...
## [Basic Join Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=join)[]()
Loading ...
## [Advanced Join Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=advanced-join)
Loading ...
## [Alternative Queries Challenges](https://www.hackerrank.com/domains/sql?filters%5Bsubdomains%5D%5B%5D=alternative-queries)

Loading ...
