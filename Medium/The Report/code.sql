select if(g.grade > 7, s.name, null), g.grade, s.marks
from students s, grades g
where marks between min_mark and max_mark
order by g.grade desc, s.name asc, s.marks asc;
