# 4.According to the purchase amount and the number of purchases in the Beijing area, identify five-star funds and four-star funds throughout four quarters.
# (five-star funds:The number of purchases is greater than or equal to 1,000, or the cumulative amount is greater than or equal to 300 million)
# (four-star funds:The number of purchases is greater than or equal to 500, or the cumulative amount is greater than or equal to 200 million)

SELECT t1.fund_cd,
		 count(t1.fund_cd) AS fund_num,
       SUM(t1.Amount) as fund_bal
		 FROM fund_detail t1
WHERE t1.zone_num='0200'AND t1.work_dt BETWEEN'2020-01-01'AND'2020-12-18'
GROUP BY 1
HAVING(fund_num>=500 AND fund_num<1000) OR (fund_bal>=200000000 AND fund_bal<300000000) OR (fund_num>=1000) OR (fund_bal>=300000000)
;
