#QUE 1- Which month had the highest sales ? 
#SOLUTION - 'November' month had the highest sales with '2118885.67'

SELECT  monthname(ORDERDATE) as Month_name, SUM(SALES) AS TOTAL_SALES 
FROM kagglesales
GROUP BY Month_name
ORDER BY TOTAL_SALES desc
LIMIT 1


#QUE 2- Which city sold the most products ?
# SOLUTION - Madrid city had the most order with '10958'

SELECT CITY , SUM(QUANTITYORDERED) AS TOTAL_QUANTITYORDERED 
FROM kagglesales
GROUP BY CITY
ORDER BY TOTAL_QUANTITYORDERED DESC
LIMIT 1;


#QUE 3- What products are more often sold together ?
# SOLUTION -

select t1.productcode, t2.productcode, count(*) as PurchaseFrequency
from kagglesales t1
inner join kagglesales t2 
on t1.ORDERNUMBER = t2.ORDERNUMBER
AND t1.PRODUCTCODE < t2.PRODUCTCODE
GROUP BY t1.PRODUCTCODE,t2.PRODUCTCODE
ORDER BY PurchaseFrequency DESC


#QUE 4- Which is the most popular shipping method ?
# SOLUTION - Classic Cars is the most popular shipping method with frequency 967

select PRODUCTLINE,count(PRODUCTLINE) as frequency from kagglesales
group by PRODUCTLINE
order by frequency desc
limit 1;


# QUE 5- Which day of the week has the highest orders?
# SOLUTION - Friday has the highest sales with 598 order quantity 

SELECT dayname(ORDERDATE) AS DAY , COUNT(QUANTITYORDERED) AS TOTAL_QUANTITYORDERED
FROM kagglesales
GROUP BY DAY
ORDER BY TOTAL_QUANTITYORDERED DESC
LIMIT 1;


#QUE 6-What is the average order value?
#SOLUTION - The average order value is '83.69'

WITH CTE AS ( SELECT *, (QUANTITYORDERED*PRICEEACH) AS order_value from kagglesales)
select round((sum(order_value)/sum(QUANTITYORDERED)),2) as avg_order_value from cte;


#QUE 7-What are the top-5 best selling products?
#SOLUTION - bellow are the top-5 best selling products.
1- S18_3232
2- S24_3856
3- S18_4600
4- S700_4002
5- S12_4473

SELECT PRODUCTCODE, SUM(QUANTITYORDERED) AS TOTAL_QUANTITYORDERED
FROM kagglesales
GROUP BY PRODUCTCODE
ORDER BY TOTAL_QUANTITYORDERED DESC
LIMIT 5;


#QUE 8- What time should we display advertisements to maximize customer engagement?

SELECT HOUR(ORDERDATE) AS hour_of_day, COUNT(*) AS total_orders
FROM kagglesales
GROUP BY hour_of_day
ORDER BY total_orders DESC
LIMIT 1;

#QUE 9-  How long does it take on average to ship a product?
# ANS - incomplete data , there is no column related to the shipping time.

#QUE 10- What is the correlation between discounts and quantity sold?
select * from kagglesales

WITH CTE AS (SELECT * , (MSRP-PRICEEACH) AS DISCOUNT FROM Kagglesales)
SELECT corr(DISCOUNT,QUANTITYORDERED) FROM CTE;












