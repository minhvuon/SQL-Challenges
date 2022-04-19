set @flat=0;
select min(startdate), min(enddate)
from (select
    case when p.start_date in (select end_date from projects) then @flat
        when p.start_date not in (select end_date from projects) then @flat:=@flat+1 end as flat,
    case when p.start_date not in (select end_date from projects) then p.start_date end as startdate,
    case when p.end_date not in (select start_date from projects) then p.end_date end as enddate
from projects p
group by p.start_date, p.end_date
order by p.start_date asc) temp
group by flat
order by count(flat) asc;
