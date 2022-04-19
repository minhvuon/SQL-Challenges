select round(s.lat_n, 4)  
from station s
where (select count(*) from station where lat_n <= s.lat_n) = (select count(*) from station where lat_n >= s.lat_n);
