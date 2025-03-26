DATA ANALYSIS

Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
select  * from retail_sales where sale_date = '2022-11-05'

Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select x.*
from(select *,
extract(month from sale_date)as month,
extract(year from sale_date)as year
from retail_sales
where category='Clothing')x
where month = 11 and year = 2022 and quantity>=4

Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category,sum(total_sale)as total_sales
from retail_sales
group by 1

Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age),2)as age
from retail_Sales
where category = 'Beauty'

Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select *
from retail_sales where total_sale>1000

Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender,category,count(transactions_id) as total_no_of_transactions
from retail_sales
group by 1,2
order by 2

Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select round(avg(total_Sale)::numeric,2)as avg_Sale,
       date_part('month',sale_date)as month
from retail_sales
group by 2
order by 2

Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
select customer_id,sum(total_sale)as highest_sale
from retail_sales
group by 1
order by 2 desc
limit 5

Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select category,count(distinct customer_id)as unique_customer
from retail_sales
group by 1

Q.10 Write a SQL query to create each shift and number of orders 
(Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
select shift,count(*)as no_of_orders
from(select *,case when date_part('hour',sale_time)<12 then 'Morning'
            when date_part('hour',sale_time)>=12 and date_part('hour',sale_time)<17 then 'Afternoon'
			else 'Evening'end as shift
from retail_sales)
group by 1
