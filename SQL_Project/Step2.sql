# 2.According to the age distribution of customers in Beijing, determine which age group has the largest number of customers, the largest total deposit amount, 
#   the largest average deposit amount, the ratio of male to female, and the opening rate of mobile banking.

SELECT case when 2020-year(t2.birth_dt)<20 then 'age<20'
            when 2020-year(t2.birth_dt)>=20 and 2020-year(t2.birth_dt)<30 then '20<=age<30'
				when 2020-year(t2.birth_dt)<40 and 2020-year(t2.birth_dt)>=30 then '30<=age<40'
            when 2020-year(t2.birth_dt)<50 and 2020-year(t2.birth_dt)>=40 then '40<=age<50'
            when 2020-year(t2.birth_dt)<60 and 2020-year(t2.birth_dt)>=50 then '50<=age<60'
				when 2020-year(t2.birth_dt)<70 and 2020-year(t2.birth_dt)>=60 then '60<=age<70'
				when 2020-year(t2.birth_dt)>=70 then '70<=age'
				ELSE'N/A' 
				END AS fd,
      COUNT(distinct t2.Party_id) AS NUM,
      SUM(t2.deposit)/10000 AS Total_Deposit,
      ROUND((SUM(t2.deposit)/COUNT(DISTINCT t2.Party_id))/10000,2) AS Avg_Deposit,
      SUM(case when gender_CD = '1'  THEN 1 ELSE 0 END) AS Male_Num,
      SUM(case when gender_CD = '2'  THEN 1 ELSE 0 END) AS Female_Num,
      SUM(case when mobile_bank = '1' THEN 1 ELSE 0 END) AS Mobile_Bank,
      ROUND(SUM(case when gender_CD = '1'  THEN 1 ELSE 0 END)/COUNT(distinct t2.Party_id),2)*100 AS Male_Percentage,
      ROUND(SUM(case when gender_CD = '2'  THEN 1 ELSE 0 END)/COUNT(distinct t2.Party_id),2)*100 AS Female_Percentage,
      ROUND(SUM(case when mobile_bank = '1'  THEN 1 ELSE 0 END)/COUNT(distinct t2.Party_id),2)*100 AS Mobile_Percentage
FROM Custom_Info2 t2
WHERE t2.zone_num = '0200'
GROUP BY fd
ORDER BY NUM desc;
