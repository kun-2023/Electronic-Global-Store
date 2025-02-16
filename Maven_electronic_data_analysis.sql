use global_electronic_retail;
-- Customer Analysis
select * from customers;
-- 1. How many customers in total, in terms of genders, how many city, continent state, country
select 
count(CustomerKey) as total_num_of_customers,
sum(case when Gender="Female" then 1 else 0 end) as total_female_num,
sum(case when Gender="Male" then 1 else 0 end) as total_male_num,
count(distinct Continent) as total_num_of_continent,
count(distinct Country) as num_of_country,
count(distinct State) as num_of_states,
count(distinct City) as num_of_city
from customers;
-- There are 11036 customers, 5480 female, 5556 male customers, 5 countries, 199 states
-- and 5622 cities. 
-- 2. How many customers in each geographic location?
-- 1.Continent
select * from customers;
with t as (select Continent, 
count(CustomerKey) as num_of_customers,
count(CustomerKey)/(select count(CustomerKey) from customers)*100 as percentage_of_customers,
sum(case when Gender="Female" then 1 else 0 end) as num_of_female,
sum(case when Gender="Male" then 1 else 0 end) as num_of_male
from customers
group by Continent
order by 1 desc)
select *, 
(num_of_female/num_of_customers)*100 as female_percentage,
(num_of_male/num_of_customers)*100 as male_percentage
from t; 
-- 62% of customers from NA, 25% from Europe, and 13% from Australia.
-- Female and Male customers are evenly constributed across all continents.
select distinct country from stores;
-- 2.Country
with t as (select Country, 
count(CustomerKey) as num_of_customers,
count(CustomerKey)/(select count(CustomerKey) from customers)*100 as percentage_of_customers,
sum(case when Gender="Female" then 1 else 0 end) as num_of_female,
sum(case when Gender="Male" then 1 else 0 end) as num_of_male
from customers
group by Country
order by 2 desc)
select *, 
(num_of_female/num_of_customers)*100 as female_percentage,
(num_of_male/num_of_customers)*100 as male_percentage
from t; -- United States has the highest amount of customers of 61.87%, 
-- followed by Germany of 13.34%, Australia of 12.86%, France of 6.07% and Italy of 5.84%
-- 3. State
with t as (select Country, State, 
count(CustomerKey) as num_of_customers,
count(CustomerKey)/(select count(CustomerKey) from customers)*100 as percentage_of_customers,
sum(case when Gender="Female" then 1 else 0 end) as num_of_female,
sum(case when Gender="Male" then 1 else 0 end) as num_of_male
from customers
group by Country, State
order by 3 desc)
select *, 
(num_of_female/num_of_customers)*100 as female_percentage,
(num_of_male/num_of_customers)*100 as male_percentage
from t;
-- Customers are somewhat concentrated across states as California owns 6.48% 
-- of total customers. Total 7 states own around 30% of total customers.
-- 
-- 4. Top City with most customers
with t as (select Country,State,City, 
count(CustomerKey) as num_of_customers,
count(CustomerKey)/(select count(CustomerKey) from customers)*100 as percentage_of_customers,
sum(case when Gender="Female" then 1 else 0 end) as num_of_female,
sum(case when Gender="Male" then 1 else 0 end) as num_of_male
from customers
group by Country,State,City
order by 4 desc)
select *, 
(num_of_female/num_of_customers)*100 as female_percentage,
(num_of_male/num_of_customers)*100 as male_percentage
from t; -- Customers are very dispersed across cities as the top city was New York with 130 customers
-- 1.178% of total population. 
-- age distribution
with t as(
select CustomerKey, 
right(Birthday,4) as birth_year, 
2025-right(Birthday,4) as age
from customers
order by age desc),
s as
(select *, floor(birth_year/10)*10 as decades
from t)
select decades, count(CustomerKey) as num_of_customers
from s
group by decades
order by 2 desc;

-- yearly customers movement
with t as(
select c.CustomerKey, c.Country,right(c.Birthday,4) as birth_year,
right(s.OrderDate ,4) as order_year
from customers c left join sales s
on c.CustomerKey=s.CustomerKey),
s as(
select *, order_year-birth_year as age
from t)
select order_year, avg(age) as avg_age,
count(CustomerKey) as num_of_unique_customers
from s
group by order_year
order by order_year;
-- average age of cuatomer are growing up, number of unique customers had grown up and peaked
-- in 2019 with 16573 unique customers, then start losing customer. There are 2432 customers
-- didn't shop between 2016 and 2021

-- Product Analysis
-- 1. KPIs of products data
select 
count(distinct ProductName) as total_unique_products,
count(distinct Brand) as total_brand,
count(distinct Category) as total_category,
count(distinct Subcategory) as total_subcategory,
count(distinct Color) as total_color
from products;

-- 2.each products margin, each category margin, each subcategry margin

-- Top Prduct Name margins;
with t as(
select *, cast(replace(UnitPriceUSD,"$","") as float) as price, 
cast(replace(UnitCostUSD,"$","") as float) as cost
from products)
select ProductName, Category, Subcategory,round((price-cost)/price*100,2) as margin,
row_number() over(order by round((price-cost)/price*100,2) desc) as d_rank
from t 
order by margin desc; -- VDV storage binders and phone systems are the top 10;


with t as(
select *, cast(replace(UnitPriceUSD,"$","") as float) as price, 
cast(replace(UnitCostUSD,"$","") as float) as cost
from products),
s as(
select *,round((price-cost)/price*100,2) as margin
from t 
order by margin desc),
u as(
select Category, ProductName, margin,
row_number() over(partition by Category order by margin desc) as c_rank
from s)
select * 
from u
where c_rank<=5; -- Top 5 product margin  for each category are all between 66 and 67 percent.

-- top product margin from each subcategory;
with t as(
select *, cast(replace(UnitPriceUSD,"$","") as float) as price, 
cast(replace(UnitCostUSD,"$","") as float) as cost
from products),
s as(
select *,round((price-cost)/price*100,2) as margin
from t 
order by margin desc),
u as(
select Category,Subcategory, ProductName, margin,
row_number() over(partition by Subcategory order by margin desc) as c_rank
from s)
select * 
from u
where c_rank<=5; -- For the subcategory, coffee machines, laptops, Televisions, waterheaters,
-- cellphones, washer and dryers have lower margins.

-- sales analysis
-- sales kpi
select * from sales;

-- total orders and yearly
select right(OrderDate,4) as year,
count(distinct OrderNumber) as total_order from sales
group by year; -- 2019 sees the most unique order from the store;
-- total customers and yearly
select right(OrderDate,4) as year,count(distinct CustomerKey) as total_customer
from sales group by year; -- Coincidently, 2019 has the most unique customers and the most unique orders
-- sales by country online and offline

with t as(
select sales.OrderNumber, p.ProductKey,p.UnitCostUSD, p.UnitPriceUSD, c.Country as customer_country,
c.CustomerKey,
sales.Quantity
from customers c right join sales
on c.CustomerKey=sales.CustomerKey
left join products p
on p.ProductKey=sales.ProductKey),
s as(
select sales.OrderNumber,p.ProductKey, p.UnitCostUSD, p.UnitPriceUSD, stores.Country as store_country,
sales.Quantity
from stores right join sales
on sales.StoreKey=stores.StoreKey
left join products p
on p.ProductKey=sales.ProductKey)
select *
from s
left join t on
s.OrderNumber=t.OrderNumber
and s.ProductKey=t.ProductKey;
-- number of unique customers from store country
select  s.Country, count(distinct c.CustomerKey)
from customers c right join sales
on c.CustomerKey=sales.CustomerKey
left join Stores s
on sales.StoreKey=s.StoreKey
group by s.Country;


select distinct Country from customers;


-- cost per order distributions

-- total sales and proft, and margins, interms of brands, country, continent, and category
with t as(
select replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","")as price, 
Quantity as quantity,
right(s.OrderDate,4) as year from sales s left join 
products p on
s.ProductKey=p.ProductKey)
select year, sum(price*quantity) as sales,
sum(cost*quantity) as costs,
sum(price*quantity)-sum(cost*quantity) as gross_profit,
(sum(price*quantity)-sum(cost*quantity))/sum(price*quantity) as profit_margin
from t
group by year; -- sales peaked in 2019, profit margin peaked in 2019.

-- yearly salesfor sales, profit and margins, 
-- interms of brands, country, continent, and category
with t as(
select replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","")as price, 
Quantity as quantity,
right(s.OrderDate,4) as year,
p.Brand, p.Category, p.Subcategory
from sales s left join 
products p on
s.ProductKey=p.ProductKey)
select Brand, sum(price*quantity) as sales,
sum(cost*quantity) as costs,
sum(price*quantity)-sum(cost*quantity) as gross_profit,
(sum(price*quantity)-sum(cost*quantity))/sum(price*quantity) as profit_margin
from t
group by Brand
order by sales desc; -- margins vary from brands to brands. DAdventure works ahs the highest sales, but lowest profit_margin.
-- Litware has the highest margin but the sales are at bottom

-- sales by category
with t as(
select replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","")as price, 
Quantity as quantity,
right(s.OrderDate,4) as year,
p.Brand, p.Category, p.Subcategory
from sales s left join 
products p on
s.ProductKey=p.ProductKey)
select Category, sum(price*quantity) as sales,
sum(cost*quantity) as costs,
sum(price*quantity)-sum(cost*quantity) as gross_profit,
(sum(price*quantity)-sum(cost*quantity))/sum(price*quantity) as profit_margin
from t
group by Category
order by sales desc; -- computers has the most sales, but 50% of profit margin, 
-- TV and Video has one of the lowest profit_margin and sales.
-- Music and Movie
-- subcategory

with t as(
select replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","")as price, 
Quantity as quantity,
right(s.OrderDate,4) as year,
p.Brand, p.Category, p.Subcategory
from sales s left join 
products p on
s.ProductKey=p.ProductKey)
select Category, Subcategory, sum(price*quantity) as sales,
sum(cost*quantity) as costs,
sum(price*quantity)-sum(cost*quantity) as gross_profit,
(sum(price*quantity)-sum(cost*quantity))/sum(price*quantity) as profit_margin
from t
group by Category, Subcategory
order by sales desc; -- desk top has the highest sales with a margin of 56%
-- two subcategory has negative margins.Televisions and washers and dryers.

-- Top customers and top products
with t as (
select OrderNumber,max(lineItem) as total_items from sales
group by OrderNumber)
select total_items, count(total_items) as total_num
from t
group by total_items;-- many customers purchase 1 item per order.

-- top customers
with t as(
select c.CustomerKey,c.Country, p.ProductKey, p.ProductName, 
s.Quantity,
replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","") as Price
from customers c
left join sales s on c.CustomerKey=s.CustomerKey
left join products p
on p.ProductKey=s.ProductKey),
s as (
select CustomerKey, Country,
sum(Quantity) as total_quantity,
sum(Price*Quantity) as total_sales,
sum(cost*Quantity) as total_cost
from t
group by CustomerKey, Country
order by total_sales desc)
select * ,(total_sales-total_cost)/total_sales as profit_margin
from s
order by total_sales desc
limit 10; -- top 10 customers are from Unites;

-- Top productd
with t as(
select c.CustomerKey,c.Country, p.ProductKey, p.ProductName, 
s.Quantity,
replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","") as Price
from customers c
left join sales s on c.CustomerKey=s.CustomerKey
left join products p
on p.ProductKey=s.ProductKey),
s as (
select CustomerKey, Country,
sum(Quantity) as total_quantity,
sum(Price*Quantity) as total_sales,
sum(cost*Quantity) as total_cost
from t
group by CustomerKey, Country
order by total_sales desc)
select * ,(total_sales-total_cost)/total_sales as profit_margin
from s
order by total_sales desc
limit 10; -- top 10 customers are from Unites;

-- top products

with t as(
select c.CustomerKey,c.Country, p.ProductKey, p.ProductName, 
s.Quantity,
replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","") as Price
from customers c
left join sales s on c.CustomerKey=s.CustomerKey
left join products p
on p.ProductKey=s.ProductKey),
s as (
select ProductName,
sum(Quantity) as total_quantity,
sum(Price*Quantity) as total_sales,
sum(cost*Quantity) as total_cost
from t
group by ProductName
order by total_sales desc)
select * ,(total_sales-total_cost)/total_sales as profit_margin
from s
order by total_sales desc
limit 10; -- top 10 products are all desktop related products;

with t as(
select c.CustomerKey,c.Country, p.ProductKey, p.ProductName, 
s.Quantity,s.CurrencyCode, right(OrderDate,4) as year,
replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","") as Price
from customers c
left join sales s on c.CustomerKey=s.CustomerKey
left join products p
on p.ProductKey=s.ProductKey),
s as(
select year, Quantity, CurrencyCode, cost, price from t)
select CurrencyCode, sum(Price*Quantity) as total_sales, 
sum(quantity*cost) as total_cost
from s group by CurrencyCode 
order by CurrencyCode desc; -- Most of customers bought in us dollars;

with t as(
select c.CustomerKey,c.Country, p.ProductKey, p.ProductName, 
s.Quantity,s.CurrencyCode, right(OrderDate,4) as year,
replace(p.UnitCostUSD,"$","") as cost,
replace(p.UnitPriceUSD,"$","") as Price
from customers c
left join sales s on c.CustomerKey=s.CustomerKey
left join products p
on p.ProductKey=s.ProductKey),
s as(
select year, Quantity, CurrencyCode, cost, price from t),
u as(
select year,CurrencyCode, sum(Price*Quantity) as total_sales, 
sum(quantity*cost) as total_cost
from s group by year,CurrencyCode 
order by CurrencyCode desc)
select year, 
sum(case when CurrencyCode="USD" then total_sales end) as usd_sales,
sum(case when CurrencyCode="EUR" then total_sales end) as EUR_sales,
sum(case when CurrencyCode="AUD" then total_sales end) as AUD_sales
from u
group by year; -- Most of customers bought in us dollars
-- Stores Analysis
select * from Stores;
select count(distinct StoreKey) as unique_number_store,
count(distinct Country) as country,
count(distinct State)
from stores;
select Country, count(StoreKey) as num_of_stores from stores
group by Country
order by 2 desc; -- united states has the most stores

select distinct Country from Stores;
