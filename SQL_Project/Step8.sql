#8.现银行开展营销活动，目标客户为累计购买基金小于1万元的客户，且当前活期存款相比于购买基金金额在1.5倍以上。
/*对于年龄为20-30之间的赠送蓝牙耳机，价值100元；
对于年龄为30-40之间的赠送购物券，价值200元；
对于年龄为40-50之间的赠送购物券，价值300元；
对于年龄为50-60之间的赠送购物券，价值400元；
对于年龄为60以上的客户的赠送购物券，价值500元。
计算出银行的最大预算是多少？*/

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