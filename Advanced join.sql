--- SQL Project Planning
select
    s.start_date,min(e.end_date)
from 
(select
    end_date
 from 
    projects
 where 
    end_date not in (select start_date from projects)) e,
    (select 
    start_date
from 
    projects
where 
    start_date not in (select end_date from projects)) s
    
where 
    s.start_date<e.end_date
group by 
    s.start_date
order by
    datediff(min(e.end_date), s.start_date) asc,
    s.start_date ;

-- Placements
select 
    s.name
from 
    students s join friends f on s.id=f.id
    join packages p on p.id=s.id
    join packages pf on pf.id=f.friend_id
where
    pf.salary>p.salary
order by
    pf.salary ;

-- Symmetric Pairs
select 
    f1.x,f1.y
from
    functions f1 ,functions f2
where
    f1.x<=f1.y
    and f1.x=f2.y
    and f1.y=f2.x
group by
    f1.x,f1.y
having 
    count(case when f1.x=f1.y then f1.x END)>2
    or count(case when f1.x<f1.y then f1.x end)=1
order by
    f1.x,f1.y;

-- Interviews
select
    c.contest_id,c.hacker_id,c.name,sum(s.ts) as tst,
    sum(s.tas)  as tast,sum(vs.tv) as tvt , sum(vs.tuv) as tuvt
from 
    contests c join colleges co on c.contest_id=co.contest_id
    join challenges ch on ch.college_id=co.college_id 
    left join (select 
                challenge_id, sum(total_submissions) as ts, sum(total_accepted_submissions) as tas
         from 
            submission_stats
          group by 
            challenge_id
         ) s on s.challenge_id=ch.challenge_id
         
    left join (select 
          challenge_id,sum(total_views) as tv,sum(total_unique_views) tuv
          from 
            view_stats
          group by 
            challenge_id
         ) vs on vs.challenge_id=ch.challenge_id

group by 
    c.contest_id,c.hacker_id,c.name
having 
    sum(s.ts)+ sum(s.tas)+sum(vs.tv)+ sum(vs.tuv) >0
order by
    c.contest_id

-- 15 Days of Learning SQL

select 
    submission_date,
       (select 
          count(distinct hacker_id) as n_unique_hacker_id
        from 
        submissions S2
        where
          S2.submission_date = S1.submission_date
        and (select
             count(distinct S3.submission_date)
             from
                submissions S3
             where
               S3.hacker_id = S2.hacker_id
             and
              S3.submission_date < S1.submission_date
        ) = Datediff(S1.submission_date, '2016-03-01')
       ) as n_unique_hackers,
       (select 
            hacker_id 
        from 
            submissions S2
        where
            S2.submission_date = S1.submission_date
        group  by
            hacker_id
        order  by count(submission_id) desc, hacker_id asc LIMIT  1
       ) as max_sub_hacker,
       (select name from hackers
        where  hacker_id = max_sub_hacker
       ) as name
from 
  (select
    distinct submission_date 
   from
    submissions) S1
group by
     submission_date;