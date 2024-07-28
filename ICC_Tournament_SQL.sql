create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup

--no of matches played, wins looses
select Team_Name,count(1) as no_matches_played,sum(win_flag) as win_count, 
count(1)-sum(win_flag) as loss_count
from
(
select  team_1 as Team_Name,
case when Team_1 = winner then 1 else 0 end as win_flag
from icc_world_cup
union all 
select  team_2 as Team_Name,
case when Team_2 = winner then 1 else 0 end as win_flag
from icc_world_cup ) A
group by Team_Name
order by win_count desc