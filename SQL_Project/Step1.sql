# 1.Query the number of customers in Beijing, the total number of current deposits, and the average deposit amount;

SELECT COUNT(DISTINCT Party_id) AS num,
       SUM(deposit)/10000 AS total_deposit,
       ROUND((SUM(deposit)/COUNT(DISTINCT Party_id))/10000,2) AS avg_deposit
FROM Custom_Info2
WHERE zone_num='0200';
