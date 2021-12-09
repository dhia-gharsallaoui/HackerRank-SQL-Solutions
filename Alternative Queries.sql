-- Draw The Triangle 1
set 
    @n_lines =21;

select 
    repeat('* ',@n_lines:=@n_lines-1)
from 
    INFORMATION_SCHEMA.TABLES
limit 20;

-- Draw The Triangle 2
set 
    @n_lines =0;

select 
    repeat('* ',@n_lines:=@n_lines+1)
from 
    INFORMATION_SCHEMA.TABLES
limit 20;

-- Print Prime Numbers
with recursive tblnums
as (
    select 2 as nums
    union all
    select nums+1 
    from tblnums
    where nums<1000)
    
select group_concat(tt.nums order by tt.nums separator '&')  as nums
from tblnums tt
where not exists 
    ( select 1 from tblnums t2 
    where t2.nums <= tt.nums/2 and mod(tt.nums,t2.nums)=0) ;