-- Revising Aggregations - The Sum Function
select 
    sum(population) 
from
    city 
where
    district="California";

-- Revising Aggregations - Averages
select 
    avg(population) 
from
    city 
where
    district="California";

-- Average Population
select
    floor(avg(population))
from 
    city;

-- Japan Population
select
    sum(population)
from 
    city
where
    countrycode='JPN';

-- Population Density Difference
select 
    max(population)-min(population)
from 
    city;

--The Blunder
select 
    ceil(avg(salary)-avg(replace(salary,0,'')))
from 
    employees;

-- Top Earners
select 
    salary*months, COUNT(*)
from 
    employee
where 
    (salary*months) = (select max(salary*months) from employee) 
group by salary*months;

-- Weather Observation Station 2
select 
    round(sum(lat_n),2),round(sum(long_w),2)
from 
    station;

-- Weather Observation Station 13
select 
    truncate(sum(lat_n),4)
from 
    station
where
    lat_n>38.7880 and lat_n<137.2345 ;

-- Weather Observation Station 14
select 
    truncate(max(lat_n),4)
from 
    station
where
    lat_n<137.2345 ;

-- Weather Oservation Station 15
select 
    round(long_w,4) 
from 
    station
where 
    lat_n =(select max(lat_n) from station where lat_n <137.2345); 

-- Weather Oservation Station 16
select 
    round(min(lat_n),4)
from 
    station
where 
     lat_n>38.7780;

-- Weather Oservation Station 17
select 
    round(long_w,4)
from 
    station
where 
     lat_n=(select min(lat_n) from station where lat_n>38.7780);

-- Weather Oservation Station 18
select 
    round(abs(max(lat_n)-min(lat_n))+abs(max(long_w)-min(long_w)),4)
from 
    station;

-- Weather Oservation Station 19
select 
    round(power((power(max(lat_n)-min(lat_n),2)+power(max(long_w)-min(long_w),2)),0.5),4)
from 
    station;

-- Weather Oservation Station 20
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

