# 3.Count the number and cumulative amount of all Beijing customers who have purchased funds between '2020-01-01' and'2020-12-18', 
#   and rank them according to the amount from highest to lowest;

SELECT t2.party_id,
       t1.fund_num,
		 t1.fund_bal
		 
FROM Custom_Info2 t2
inner JOIN(SELECT a1.party_id,
				COUNT(*) AS fund_num,
				SUM(a1.AMOUNT) AS fund_bal
				FROM fund_detail a1
            WHERE a1.work_dt BETWEEN '2020-01-01'AND'2020-12-18'
				GROUP BY 1) t1
ON t1.party_id = t2.Party_id
WHERE t2.zone_num='0200'
ORDER BY 2 DESC;
