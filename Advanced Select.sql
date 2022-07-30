-- Type of Triangle
Select case 
    when  (A+B<=C or A+C<=B or B+C<=A ) then 'Not A Triangle'
    when (A=B) and(B=C) then 'Equilateral' 
    when (A=B or B=C or A=C)  then 'Isosceles'
    else 'Scalene'
    End as "triangle_type"
    from triangles;

-- The PADS
select CONCAT_WS('',name,'(',left(occupation,1),')')  
    from occupations 
    order by name;

select CONCAT_WS("","There are a total of ",count(occupation)," ",LOWER(occupation),"s.") 
    from occupations 
    group by occupation
    order by count(occupation), occupation; 

-- Occupations

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

-- Binary Tree Nodes

select N,case  
    when P is NULL then 'Root'
    WHEN EXISTS (SELECT B.P FROM BST B WHERE B.P = BT.N) THEN 'Inner'        
    else 'Leaf' end as node_type
    from BST  as BT order by N;

-- New Companies

    --- With left join
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
    
    --- without left join
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