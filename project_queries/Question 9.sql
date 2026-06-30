-- Which products generate the highest profit, not just revenue?
use AdventureWorks_Project

select 
p.Name,
sum(sod.Profit) as total_profit ,
sum(sod.LineTotal) as revenue
from SalesOrderDetail as sod
left join product as p
on sod.ProductID = p.ProductID
group by p.Name
order by total_profit desc , revenue desc;
