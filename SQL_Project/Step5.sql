#5.统计出各个年龄段，累计购买基金大于等于10万元的客户数量、购买笔数和金额分布；

SELECT case when 2020-year(t2.birth_dt)<20 then 'age<20'
				when 2020-year(t2.birth_dt)>=20 and 2020-year(t2.birth_dt)<30 then '20<=age<30'
				when 2020-year(t2.birth_dt)<40 and 2020-year(t2.birth_dt)>=30 then '30<=age<40'
				when 2020-year(t2.birth_dt)<50 and 2020-year(t2.birth_dt)>=40 then '40<=age<50'
				when 2020-year(t2.birth_dt)<60 and 2020-year(t2.birth_dt)>=50 then '50<=age<60'
				when 2020-year(t2.birth_dt)<70 and 2020-year(t2.birth_dt)>=60 then '60<=age<70'
				when 2020-year(t2.birth_dt)>=70 then '70<=age'
				ELSE'N/A'END AS fd,
				COUNT(t2.Party_id) AS NUM,
				COUNT(t1.Party_id) AS fund_client,
				SUM(t1.fund_num) AS fund_num,
				SUM(t1.fund_bal) AS fund_bal
FROM Custom_Info2 t2
left JOIN(SELECT a1.party_id,
			COUNT(*) AS fund_num,
			SUM(a1.AMOUNT) AS fund_bal
			FROM fund_detail a1
			WHERE a1.work_dt BETWEEN '2020-01-01'AND'2020-12-18'
			GROUP BY 1
			HAVING fund_bal>=100000) t1
ON t1.party_id=t2.Party_id
WHERE t2.zone_num = '0200'
GROUP BY 1
;