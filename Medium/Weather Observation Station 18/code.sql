select round(abs(min(lat_n) - max(lat_n)) + (max(long_w) - min(long_w)), 4)
from station;
