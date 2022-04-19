Write a query to print all prime numbers less than or equal to **1000**. Print your result on a single line, and use the ampersand (**&**) character as your separator (instead of a space).

For example, the output for all prime numbers **<=10** would be:
```
2&3&5&7
```
### Explain code
```
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
```
