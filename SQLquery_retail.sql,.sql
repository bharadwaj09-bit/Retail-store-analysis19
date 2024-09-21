use master

select * from df_orders

--find top 10 highest revenue generating products 

select top 10 product_id , sum(sale_price) as revenue from df_orders
group by product_id
order by revenue desc

--(output: Product TEC-CO-10004722 has the highest sales of $40740.00,followed
         -- by product OFF-BI-10003527 with $18293..etc)


--find top 5 highest selling products in each region
with cte as (
select region, product_id , sum(sale_price) as sales
from df_orders
group by product_id,region)
select * from (
select * , ROW_NUMBER() over(partition by region order by sales desc) as rn
from cte) A
where rn<=5

--(output:

--find month over month growth comparison for 2022 and 2023 sales eg : jan2022 vs jan2023
with cte as (
select year(order_date) as order_year,month(order_date)as order_month,
sum(sale_price) as revenue 
from df_orders
group by year(order_date),month(order_date))
select order_month
,sum(case when order_year=2022 then revenue else 0 end) as revenue_2022
,sum(case when order_year=2023 then revenue else 0 end) as revenue_2023
from cte
group by order_month
order by order_month


--for each category which month had highest sales
select * from df_orders

with cte as(
select category,format(order_date,'yyyyMM') as order_year_month
,sum(sale_price) as sales
from df_orders
group by category,format(order_date,'yyyyMM')
)
select * from (
select *,
row_number() over(partition by category order by sales desc) as rn
from cte) a 
where rn=1



--which sub-category had highest growth by percentage in 2023 compare to 2022

with cte as (
select sub_category,year(order_date) as order_year,
sum(sale_price) as sales
from df_orders
group by sub_category,year(order_date)
)
, cte2 as (
select sub_category
,sum(case when order_year=2022 then sales else 0 end) as sales_2022
,sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte
group by sub_category
)
select top 1 *
,(sales_2023-sales_2022)*100/sales_2022 as growth_percentage
from cte2 
order by (sales_2023-sales_2022)*100/sales_2022 desc
