[SQL Project Planning](https://www.hackerrank.com/challenges/sql-projects/problem)

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

![image](https://s3.amazonaws.com/hr-challenge-images/12894/1443819551-639948acc0-1.png)

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

**Sample Input**

![image](https://s3.amazonaws.com/hr-challenge-images/12894/1443819440-1c40e943a1-2.png)

**Sample Output**
```
2015-10-28 2015-10-29
2015-10-30 2015-10-31
2015-10-13 2015-10-15
2015-10-01 2015-10-04
```
**Explanation**

The example describes following four projects:

* Project 1: Tasks 1, 2 and 3 are completed on consecutive days, so these are part of the project. Thus start date of project is 2015-10-01 and end date is 2015-10-04, so it took 3 days to complete the project.
* Project 2: Tasks 4 and 5 are completed on consecutive days, so these are part of the project. Thus, the start date of project is 2015-10-13 and end date is 2015-10-15, so it took 2 days to complete the project.
* Project 3: Only task 6 is part of the project. Thus, the start date of project is 2015-10-28 and end date is 2015-10-29, so it took 1 day to complete the project.
* Project 4: Only task 7 is part of the project. Thus, the start date of project is 2015-10-30 and end date is 2015-10-31, so it took 1 day to complete the project.

### Explain code

```SQL
set @flag=0;
select min(startdate), min(enddate)
from (select
        case when p.start_date in (select end_date from projects) then @flag
            when p.start_date not in (select end_date from projects) then @flag:=@flag+1 end as flag,
        case when p.start_date not in (select end_date from projects) then p.start_date end as startdate,
        case when p.end_date not in (select start_date from projects) then p.end_date end as enddate
    from projects p
    group by p.start_date, p.end_date
    order by p.start_date asc) temp /* tạo temp table chứa start date, end date của project và column flag để đánh dấu start and end date thuộc project nào */
group by flag
order by count(flag) asc;
```
- Tạo temp table
- select min hai column start and end date để loại bỏ value null, group theo column flag
