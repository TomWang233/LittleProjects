#4.分别根据北京地区购买金额和购买笔数，选出四个季度的五星基金和四星基金；(五星基金:购买笔数大于等于1000，或金额累计大于等于3亿；四星基金:购买笔数大于等于500，或金额累计大于等于2亿)

SELECT t1.fund_cd,
		 count(t1.fund_cd) AS fund_num,
       SUM(t1.Amount) as fund_bal
		 FROM fund_detail t1
WHERE t1.zone_num='0200'AND t1.work_dt BETWEEN'2020-01-01'AND'2020-12-18'
GROUP BY 1
HAVING(fund_num>=500 AND fund_num<1000) OR (fund_bal>=200000000 AND fund_bal<300000000) OR (fund_num>=1000) OR (fund_bal>=300000000)
;