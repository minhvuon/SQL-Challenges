set @str='There are a total of ';
select 
    if(occupation = 'Doctor', concat(name, '(D)'), 
      if(occupation = 'Professor', concat(name, '(P)'),
        if(occupation = 'Actor', concat(name, '(A)'), concat(name, '(S)'))))
from occupations
order by name;
select 
    case 
        when occupation = 'Doctor' then concat(@str, max(countocc), ' ', lower(occupation), 's.')
        when occupation = 'Professor' then concat(@str, max(countocc), ' ', lower(occupation), 's.')
        when occupation = 'Actor' then concat(@str, max(countocc), ' ', lower(occupation), 's.')
        when occupation = 'Singer' then concat(@str, max(countocc), ' ', lower(occupation), 's.') end
from (select 
        case 
            when occupation = 'Doctor' then count(*)
            when occupation = 'Professor' then count(*)
            when occupation = 'Actor' then count(*)
            when occupation = 'Singer' then count(*) end as countocc,
            occupation
    from occupations
    group by occupation) Temp
group by countocc, occupation
order by countocc, occupation;
