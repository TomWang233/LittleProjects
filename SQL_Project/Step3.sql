#3.统计出所有北京的客户中在'2020-01-01'AND'2020-12-18'之间购买过基金的笔数和累计金额，并根据金额由高到低排列；

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