select w1.id, temp.age, temp.mincoin, temp.power
from (select w.code, wp.age, min(w.coins_needed) as mincoin, w.power
        from wands w 
            join wands_property wp on w.code = wp.code
        where wp.is_evil = 0
        group by w.code, wp.age, w.power) temp, wands w1
where w1.code = temp.code and w1.coins_needed = temp.mincoin and w1.power = temp.power
order by temp.power desc, temp.age desc;
