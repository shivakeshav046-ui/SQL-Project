-- Are there territories with high order volume but low profitability? -- 121317
use AdventureWorks_Project;
select 
st.name,
count( distinct soh.SalesOrderDetailID) as total_orders_placed,
sum(soh.Profit) as total_profit
from SalesOrderDetail as soh
left join   SalesOrderHeader as sod
on soh.SalesOrderID =sod.SalesOrderID
left join SalesTerritory as st
on sod.TerritoryID =st.TerritoryID
group by st.Name
order by total_orders_placed desc;

