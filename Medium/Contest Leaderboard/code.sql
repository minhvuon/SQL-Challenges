select h.hacker_id, h.name, sum(maxscore) as sumscore
from (select s.hacker_id, s.challenge_id, max(score) as maxscore
    from submissions s 
    group by s.hacker_id, s.challenge_id) temp
    join hackers h on temp.hacker_id = h.hacker_id
group by h.hacker_id, h.name
having sumscore > 0
order by sumscore desc, h.hacker_id asc;
