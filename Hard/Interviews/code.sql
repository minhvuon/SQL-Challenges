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
