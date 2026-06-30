-- Which territories show the highest revenue growth rate year-over-year?
use AdventureWorks_Project;
select
st.name,
year(soh.OrderDate) as year_,
sum(soh.SubTotal) as sales,
LAG(sum(soh.SubTotal)) over(partition by st.name
order by year(soh.orderDate) ) as prev_sales,
----------------------------------------------
( (sum(soh.SubTotal) - LAG(sum(soh.SubTotal))
over(partition by st.name
order by year(soh.orderDate) ) ))  as difference_,
ROUND(
(
(SUM(soh.SubTotal) -
LAG(SUM(soh.SubTotal)) OVER(PARTITION BY st.Name ORDER BY YEAR(soh.OrderDate)))
*100.0
)
/
LAG(SUM(soh.SubTotal)) OVER(PARTITION BY st.Name ORDER BY YEAR(soh.OrderDate)),
2
) AS growth_percentage
from
SalesOrderHeader as soh
left join SalesTerritory as st
on soh.TerritoryID = st.TerritoryID
where year(soh.OrderDate) < 2025
group by st.Name , year(soh.OrderDate)
ORDER BY st.Name,YEAR(soh.OrderDate)
