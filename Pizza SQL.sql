select*
from dbo.pizza_sales;

-- the sum of total price of all pizza orders -- 
select round(sum(total_price),2) as total_revenue
from dbo.pizza_sales;

-- average amount spent per order -- 
select round(sum(total_price)/count(distinct order_id),2) as average_price
from dbo.pizza_sales;

-- sum of quantities of all pizzas sold -- 
select sum(quantity) as pizzas_sold
from dbo.pizza_sales;

-- total number of ordersplaced--
select count(distinct order_id) as total_orders
from dbo.pizza_sales;

--average pizza per order --
select round(sum(quantity)/count(distinct order_id),2) as average_order
from dbo.pizza_sales;

--daily/monthly trend for total orders--
select datename(DW, order_date) as order_day, count(distinct order_id) as total_orders
from dbo.pizza_sales
group by datename(DW, order_date);

select datename(month, order_date) as month_name, count(distinct order_id) as total_orders
from dbo.pizza_sales
group by datename(month, order_date)
order by total_orders desc;

--percentage of sales by pizza categories--
select pizza_category, round((sum(total_price)/(select sum(total_price) from dbo.pizza_sales)*100),2) as 'percent', round(sum(total_price),2) as total_sales
from dbo.pizza_sales
group by pizza_category
order by 'percent' desc;

select pizza_size, round((sum(total_price)/(select sum(total_price) from dbo.pizza_sales)*100),2) as 'percent', round(sum(total_price),2) as total_sales
from dbo.pizza_sales
group by pizza_size
order by 'percent' desc;

-- top 5 best/worst sellers by revenue, total quality, and total order--
select*
from dbo.pizza_sales;

select top 5 pizza_name, round(sum(total_price),2) as total_revenue
from dbo.pizza_sales
group by pizza_name
order by total_revenue desc
;

select top 5 pizza_name, round(sum(total_price),2) as total_revenue
from dbo.pizza_sales
group by pizza_name
order by total_revenue asc
;

select top 5 pizza_name, sum(quantity) as total_revenue
from dbo.pizza_sales
group by pizza_name
order by total_revenue desc
;

select top 5 pizza_name, sum(quantity) as total_revenue
from dbo.pizza_sales
group by pizza_name
order by total_revenue asc
;

select top 5 pizza_name, count(distinct order_id) as total_orders 
from dbo.pizza_sales
group by pizza_name
order by total_orders asc
;
