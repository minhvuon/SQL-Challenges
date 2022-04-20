select temp2.submission_date, temp2.unihacker, temp2.hk, h.name
from( select temp.submission_date, 
        (select count(distinct hacker_id)  
        from submissions s2  
        where s2.submission_date = temp.submission_date 
            and (select count(distinct s3.submission_date) 
                 from submissions s3 
                 where s3.hacker_id = s2.hacker_id 
                    and s3.submission_date < temp.submission_date) = dateDIFF(temp.submission_date , '2016-03-01')) as unihacker, min(temp.hacker_id) as hk
    from (select s.submission_date, s.hacker_id, count(s.hacker_id) as counthk
        from submissions s
        group by s.submission_date, s.hacker_id) temp
    where counthk = (select max(counthk) 
                     from (select s.submission_date, s.hacker_id, count(s.hacker_id) as counthk
                            from submissions s
                            group by s.submission_date, s.hacker_id) temp1
                     where temp.submission_date = temp1.submission_date
                    group by temp1.submission_date)
    group by temp.submission_date) temp2, hackers h
where temp2.hk = h.hacker_id
order by temp2.submission_date;
