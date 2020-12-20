#研究北京地区的客户在2020年购买基金的情况，根据年龄段来查看他们的金额和笔数分布，并开展营销费用的预算。（金额以万元为单位，小数点保留两位）

# 1.查询北京地区的客户数量，和活期存款总数，以及人均存款金额；

SELECT COUNT(DISTINCT Party_id) AS num,
       SUM(deposit)/10000 AS total_deposit,
       ROUND((SUM(deposit)/COUNT(DISTINCT Party_id))/10000,2) AS avg_deposit
FROM Custom_Info2
WHERE zone_num='0200';