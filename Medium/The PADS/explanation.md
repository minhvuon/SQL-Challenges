[The PADS](https://www.hackerrank.com/challenges/the-pads/problem)

Generate the following two result sets:

1. Query an alphabetically ordered list of all names in **OCCUPATIONS**, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: ```AnActorName(A)```, ```ADoctorName(D)```, ```AProfessorName(P)```, and ```ASingerName(S)```.
2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
```
There are a total of [occupation_count] [occupation]s.
```
where ```[occupation_count]``` is the number of occurrences of an occupation in **OCCUPATIONS** and ```[occupation]``` is the lowercase occupation name. If more than one Occupation has the same ```[occupation_count]```, they should be ordered alphabetically.

**Note**: There will be at least two entries in the table for each type of occupation.

**Input Format**

The **OCCUPATIONS** table is described as follows:Occupation will only contain one of the following values: **Doctor**, **Professor**, **Singer** or **Actor**.

**Sample Input**

An **OCCUPATIONS** table that contains the following records:

![image](https://s3.amazonaws.com/hr-challenge-images/12889/1443816608-0b4d01d157-2.png)

**Sample Output**
```
Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.
```
**Explanation**

The results of the first query are formatted to the problem description's specifications.
The results of the second query are ascendingly ordered first by number of names corresponding to each profession (**2 <= 2 <= 3 <= 3**), and then alphabetically by profession (**doctor <= singer**, and **actor <= professor**).

### Explain code
```SQL
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
    group by occupation) Temp /* tạo temp table chứa tổng số lượng các occupation */
group by countocc, occupation
order by countocc, occupation;
```
- Câu lệnh select thứ nhất kiểm tra điều kiện nếu occupation thoải điều kiện thì gán kí tự đầu tiên của occupation vào name
- Câu lệnh thứ 2, lấy max của column chứa số lượng occupation group theo occupation,
- Sắp xêp theo số lượng occupation và name occupation
