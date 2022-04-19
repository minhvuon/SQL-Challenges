select s.name
from (select f.id, f.friend_id, p.salary
        from friends f
        left join packages p on f.friend_id = p.id) temp 
    join packages p1 on temp.id = p1.id
    join students s on temp.id = s.id
where temp.salary > p1.salary
order by temp.salary asc;
