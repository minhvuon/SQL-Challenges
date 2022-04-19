set @r1=0, @r2=0, @r3=0, @r4=0;
select min(doctor), min(professor), min(singer), min(actor)
from ( select 
    case
        when occupation = 'doctor' then (@r1:=@r1+1)
        when occupation = 'professor' then (@r2:=@r2+1)
        when occupation = 'singer' then (@r3:=@r3+1)
        when occupation = 'actor' then (@r4:=@r4+1) end as rownumber,
    case when occupation = 'doctor' then name end as doctor,
    case when occupation = 'professor' then name end as professor,
    case when occupation = 'singer' then name end as singer,
    case when occupation = 'actor' then name end as actor
from occupations
order by name) as temp
group by rownumber;
