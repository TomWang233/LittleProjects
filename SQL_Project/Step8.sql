# 8.Our bank plans to carry out marketing activities, and the target customers are customers who have purchased funds less than 10,000, 
#   and the current demand deposits are more than 1.5 times the amount of funds purchased;
/*For age between 20-30, gift Bluetooth headsets worth 100;
For age between 30-40, gift Shopping vouchers worth 200;
For age between 40-50, gift Shopping vouchers worth 300;
For age between 50-60, gift Shopping vouchers worth 400;
For age above 60, gift Shopping vouchers worth 500;
Calculate the maximum bugdet for this event.*/

SELECT case when 2020-year(t2.birth_dt)>=20 and 2020-year(t2.birth_dt)<30 then '20<=age<30'
				when 2020-year(t2.birth_dt)<40 and 2020-year(t2.birth_dt)>=30 then '30<=age<40'
				when 2020-year(t2.birth_dt)<50 and 2020-year(t2.birth_dt)>=40 then '40<=age<50'
				when 2020-year(t2.birth_dt)<60 and 2020-year(t2.birth_dt)>=50 then '50<=age<60'
				when 2020-year(t2.birth_dt)>=60 then 'age>=60'
				ELSE'N/A'END AS fd,
				count(case when t2.deposit/t1.fund_bal > 1.5 then 1 ELSE 0 END)AS object_NUM
				
FROM Custom_Info2 t2
left JOIN(SELECT a1.party_id,
			COUNT(*) AS fund_num,
			SUM(a1.AMOUNT) AS fund_bal
			FROM fund_detail a1
			WHERE a1.work_dt BETWEEN '2020-01-01'AND'2020-12-18'
			GROUP BY 1
			HAVING fund_bal<10000) t1
ON t1.party_id=t2.Party_id
WHERE t2.zone_num = '0200'
GROUP BY 1
;
