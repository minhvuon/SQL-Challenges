select *
from (select c.hacker_id, h.name, count(c.hacker_id) as numchal
    from challenges c
        join hackers h on c.hacker_id = h.hacker_id
    group by c.hacker_id, h.name) temp
where (select count(temp1.numchal) from (select c.hacker_id, h.name, count(c.hacker_id) as numchal
                                            from challenges c
                                                join hackers h on c.hacker_id = h.hacker_id
                                            group by c.hacker_id, h.name) temp1
                                        where temp1.numchal = temp.numchal) = 1 
    or temp.numchal = (select max(temp2.numchal) from (select c.hacker_id, h.name, count(c.hacker_id) as numchal
                                            from challenges c
                                                join hackers h on c.hacker_id = h.hacker_id
                                            group by c.hacker_id, h.name) temp2)
order by temp.numchal desc, temp.hacker_id;
