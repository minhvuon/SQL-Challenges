[Weather Observation Station 20](https://www.hackerrank.com/challenges/weather-observation-station-20/problem)

A [median](https://en.wikipedia.org/wiki/Median) is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from **STATION** and round your answer to **4** decimal places.

**Input Format**

The **STATION** table is described as follows:

![image](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.

### Explain code
```
select round(s.lat_n, 4)  
from station s
where (select count(*) from station where lat_n <= s.lat_n) = (select count(*) from station where lat_n >= s.lat_n);
```
