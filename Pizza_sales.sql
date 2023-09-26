create database pizza_sales
use pizza_sales;


-- Total Revenue (sum of total price)
select sum(total_price) as total_revenue from pizza_sales;

-- Find average order value(total revenue/total order)
select sum(total_price)/count(distinct(order_id)) as avg_order from pizza_sales;

-- Total pizza sold
select sum(quantity) as total_sold_quantity from pizza_sales;

-- Total number of order placed
select count(distinct(order_id)) from pizza_sales;

-- Average pizzas per order(total no of pizza sold/total no of order)
select sum(quantity) / count(distinct(order_id) as decimal(10,2)) as avg_pizza_per_order from pizza_sales;

-- Daily Trend for total order
select * from pizza_sales;
select date_format(order_date, '%Y/%m/%d') as day_name from pizza_sales;
select dayname(order_date) as order_day, count(distinct(order_id)) as total_orders from pizza_sales
group by dayname(order_date);