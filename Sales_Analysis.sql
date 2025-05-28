create database Company;
use Company;
# Q1 : find all orders shipped via 'economy' mode with a total amount greater than ₹25,000
select * from company.sales where ship_mode = 'Economy' and Total_Amount > 25000;
# Q2 : retrieve all sales data for 'technology' category in 'Ireland' made after 2020-01-01
select * from company.sales where category = 'Technology'  and country = 'Ireland' and STR_TO_DATE(order_date, '%d/%m/%Y') > '2020-01-01';
# Q3 : List the top 10 most profitable sales transactions in descending order.
select * from company.sales order by Unit_profit desc limit 10;
# if we right like this then it skips the first 10 and displays the other 20 records;
select * from company.sales order by Unit_profit desc limit 10, 20;
# Q4 : Find all customers whose name starts with 'J' and ends with 'n'.
select order_id, customer_name from company.sales where customer_name like 'J%n';
# Q5 : retrieve all product names that contain 'Acco' anywhere in the name.
select order_id, product_name from company.sales where product_name like '%Acco%';
# Q6 : get top 5 cities with highest total sales amount.
select city, sum(total_amount) as total_sales from company.sales group by city order by total_sales desc limit 5;
# Q7 : display the second set of 10 records for customer_name and total_amount in decreasing order.
select customer_name, total_amount from company.sales order by total_amount desc limit 10, 10;
# Q8 : find the total revenue, average unit cost, and total number of orders.
select sum(total_amount) as `Total sales`, avg(unit_cost) as `Average unit cost`, count(order_id) as `Total orders` from company.sales; 
# use `` for printing the whitespave between two variables.
# Q9 : count unique number of regions
select count(distinct region) as `No of Region` from sales;
# Q10 : find the number of orders placed by each customer.
select count(order_id) as `order list`, customer_name from sales group by customer_name order by `order list` desc;
# Q11 : Rank 5 products based on total sales using rank().
# there are four type of ranking function: 1. row_number, 2. rank(), 3. dense_rank(), 4. ntile().
select product_name, sum(total_amount) as `total sales`, rank() over (order by sum(total_amount) desc) as sales_rank from sales group by product_name limit 5;

