[Interviews](https://www.hackerrank.com/challenges/interviews/problem)

Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .

**Note**: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

**Input Format**

The following tables hold interview data:

* Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, and name is the name of the hacker.

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458517426-e017c3460e-ScreenShot2016-03-21at4.57.47AM.png)

* Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates.

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458517503-fd4aa63111-ScreenShot2016-03-21at4.57.56AM.png)

* Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, and college_id is the id of the college where the challenge was given to candidates.

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458517661-a642f750ce-ScreenShot2016-03-21at4.58.04AM.png)

* View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge was viewed by candidates, and total_unique_views is the number of times the challenge was viewed by unique candidates.

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458517983-b4302286a8-ScreenShot2016-03-21at4.58.15AM.png)

* Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions for the challenge, and total_accepted_submission is the number of submissions that achieved full scores.

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458518090-80983c916a-ScreenShot2016-03-21at4.58.27AM.png)

**Sample Input**

Contests Table:

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458519044-d788f8a6ee-ScreenShot2016-03-21at4.58.39AM.png)

Colleges Table:

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458519098-912836d6ac-ScreenShot2016-03-21at4.59.22AM.png)

Challenges Table:

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458519120-c531743caf-ScreenShot2016-03-21at4.59.32AM.png)

View_Stats Table:

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458519152-107a67866b-ScreenShot2016-03-21at4.59.43AM.png)

Submission_Stats Table:

![image](https://s3.amazonaws.com/hr-challenge-images/19596/1458519173-091aba871a-ScreenShot2016-03-21at4.59.55AM.png)

**Sample Output**
```
66406 17973 Rose 111 39 156 56
66556 79153 Angela 0 0 11 10
94828 80275 Frank 150 38 41 15
```
**Explanation**

The contest **66406** is used in the college **11219**. In this college **11219**, challenges **18765** and **47127** are asked, so from the view and submission stats:

* Sum of total submissions **= 27 + 56 + 28 = 111**

* Sum of total accepted submissions **= 10 + 18 + 11 = 39**

* Sum of total views **= 43 + 72 + 26 + 15 = 256**

* Sum of total unique views **= 10 + 13 + 19 + 14 = 56**

Similarly, we can find the sums for contests **66556** and **94828**.

### Explain code
```SQL
select temp.contest_id, temp.hacker_id, temp.name, temp.sumsub, temp.sumaccsub, temp1.sumview, temp1.sumuniview
from (select cl.contest_id, ct.hacker_id, ct.name, sum(ss.total_submissions) as sumsub, sum(ss.total_accepted_submissions) as sumaccsub
      from contests ct
            join colleges cl on ct.contest_id = cl.contest_id
            join challenges chl on cl.college_id = chl.college_id
            join submission_stats ss on chl.challenge_id = ss.challenge_id
        group by cl.contest_id, ct.hacker_id, ct.name) temp
    join (select cl.contest_id, ct.hacker_id, ct.name, sum(vs.total_views) as sumview, sum(vs.total_unique_views) as sumuniview 
      from contests ct
            join colleges cl on ct.contest_id = cl.contest_id
            join challenges chl on cl.college_id = chl.college_id
            join view_stats vs on chl.challenge_id = vs.challenge_id
        group by cl.contest_id, ct.hacker_id, ct.name) temp1 on temp.contest_id = temp1.contest_id and temp.hacker_id = temp1.hacker_id
having (temp.sumsub + temp.sumaccsub + temp1.sumview + temp1.sumuniview) > 0
order by temp.contest_id;
```
