[Occupations](https://www.hackerrank.com/challenges/occupations/problem)

Pivot the Occupation column in **OCCUPATIONS** so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

**Note**: Print **NULL** when there are no more names corresponding to an occupation.

**Input Format**

The **OCCUPATIONS** table is described as follows:

![image](https://s3.amazonaws.com/hr-challenge-images/12889/1443816414-2a465532e7-1.png)

Occupation will only contain one of the following values: **Doctor**, **Professor**, **Singer** or **Actor**.

**Sample Input**

![image](https://s3.amazonaws.com/hr-challenge-images/12890/1443817648-1b2b8add45-2.png)

**Sample Output**
```
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
```
**Explanation**

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with **NULL** values.

### Explain code
```SQL
set @r1=0, @r2=0, @r3=0, @r4=0;
select min(doctor), min(professor), min(singer), min(actor)
from ( select 
    case
        when occupation = 'doctor' then (@r1:=@r1+1)
        when occupation = 'professor' then (@r2:=@r2+1)
        when occupation = 'singer' then (@r3:=@r3+1)
        when occupation = 'actor' then (@r4:=@r4+1) end as rownumber, /* thêm column rownumber làm column flag, dựa vào column này ta biết được thứ tự của các name ở row nào */
    case when occupation = 'doctor' then name end as doctor,
    case when occupation = 'professor' then name end as professor,
    case when occupation = 'singer' then name end as singer,
    case when occupation = 'actor' then name end as actor
from occupations
order by name) as temp /* tạo temp table có các column là occupation và value là name hoặc 
group by rownumber;
```
- Tạo temp table có các column occupation chứa những value name và column flag để biết được name thuộc row nào
- Group temp table theo column flag
- Sử dụng hàm min để loại bỏ các giá trị null trong table và gộp các value name lại với nhau chung một hàng dựa trên flag
