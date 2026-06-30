-- Which territories contribute the most revenue and profit
use AdventureWorks_Project;
SELECT 
st.name,
SUM(sod.LineTotal) as revenue ,
sum(sod.Profit) as profit

FROM SalesOrderHeader as soh
JOIN SalesOrderDetail as sod
ON soh.SalesOrderID = sod.SalesOrderID
JOIN SalesTerritory as st
ON soh.TerritoryID = st.TerritoryID
group by st.name
-- having sum(sod.Profit) < 0 
order by revenue desc,profit desc;