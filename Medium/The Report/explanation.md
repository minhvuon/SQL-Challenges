[The Report](https://www.hackerrank.com/challenges/the-report/problem)

You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.

![image](https://user-images.githubusercontent.com/54706711/163750239-7ca4eb16-5802-4ed7-b6a6-bab28aa996fc.png)

Grades contains the following data:

![image](https://user-images.githubusercontent.com/54706711/163750259-8374a0d0-66eb-4c85-a3e0-375a4adbbd4c.png)

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.

**Sample Input**

![image](https://user-images.githubusercontent.com/54706711/163750295-d4fbb5d4-42eb-462a-bc76-78aa09d0d586.png)

**Sample Output**
```
Maria 10 99
Jane 9 81
Julia 9 88 
Scarlet 8 78
NULL 7 63
NULL 7 68
```
**Note**

Print "NULL" as the name if the grade is less than 8.

**Explanation**

Consider the following table with the grades assigned to the students:

![image](https://user-images.githubusercontent.com/54706711/163750318-ea65065e-fb12-4df8-b769-c373469d8d87.png)

So, the following students got 8, 9 or 10 grades:

* Maria (grade 10)
* Jane (grade 9)
* Julia (grade 9)
* Scarlet (grade 8)

### Explain code
```
select if(g.grade > 7, s.name, null), g.grade, s.marks
from students s, grades g
where marks between min_mark and max_mark
order by g.grade desc, s.name asc, s.marks asc;
```
- Cần select name, grade và mark từ hai bảng students và grades, sử dụng điều kiện where để lọc ra những marks đúng với grade dựa vào min_mark và max_mark.
- Dùng điều kiện if trong lệnh select để tìm ra những name có grade nhỏ hơn 7 và gán value of name = null.
