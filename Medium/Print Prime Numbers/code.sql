select group_concat( numb separator '&')
from(
    select @num:=@num+1 as numb 
    from
        information_schema.tables t1,
        information_schema.tables t2,
        (select @num:=1) temp
) temp2
where numb <= 1000 and not exists ( 
    select *
    from(
       select @num1:=@num1+1 as numb1
       from information_schema.tables t1,
            information_schema.tables t2,
            (select @num1:=1) temp1
        limit 1000) temp3
    where floor(numb/numb1) = (numb/numb1) and numb1 < numb and numb1 > 1);
