# Sata Analysis on Electronic Global Store

<h3>Table of Content</h3>
<ul>
<li>Case Description</li>
<li>Datasets Description</li>
<li>Executive Summary</li>
<li>Deep Dives</li>
<li>Recommendations</li>
<li>Dashboard Preview</li>
</ul>



<h3>Case Description</h3>
<p>Maven Global Electronic Store is an electronic company selling appliances, devices, equipment ranging from computers to videos to players. It operates in 7 nations and online stores with delivery services. The company’s sales had experienced a sales increase since 2016 until it peaked in 2019 and started plummeting in 2020. However, the company can still hold the margin in the normal level despite the sale plunge. Now, they company hired me to find out the reason behind the sales plunge and possible solutions to reverse the trend. I was given the company’s data regarding to customers, products, sales, and stores from January 206 to January 2021.  I will perform a diagnostic analysis on the datasets. The analysis was done in both SQL and Tableau. The dashboard was also done in Tableau. </p>


<h3>Datasets Description</h3>
<p>This dataset can be available at the website called Maven data playground, and it  includes five tables as they are customers, exchange rates, products, sales, and stores. </p>

![datasets description](https://github.com/user-attachments/assets/246ffbb2-0f87-4159-8595-1c9ca0ca4b69)
![Data_Model](https://github.com/user-attachments/assets/94b37ff8-a406-45dd-a3c3-4dc2a48e8f10)



<h3>Executive Summary</h3>
<p>Maven Global Electronics has 15024 unique customers from 7 countries. They are US, UK, Germany, Canada, Italy, Netherlands, and France. With 60% of the customers come from US. Around 50% male and 50% female. The average age of customers is 50 years-old. The total sales of the business from 2016 to January 2021 is 55 million dollars in total with total gross profit of 32.66 million dollars. The year with the highest sales was 2019 of 7.4 million dollars. The yearly sales have been going up from 2016 until it peaked in 2019. It has been coming down since. It has been coinciding with the trend of the number of unique orders and the number of unique customers. There are 2517 products in 8 categories, and the most sold category was computer with 8 million dollars with a margin of 50%. The country with the most sales were US, online sales, UK, Germany and Canada of 6.1 million, 3.7 million, 2.86 million and 2.4 million dollars. Online sales count 25% of the total sales. The online sales delivery had been reduced from 2016 of 8 days on average to 5 days in January 2021. </p>
<p> All the countries had experienced sales plummeting since the year 2020. Number of products, number of unique customers, and number of orders had been coming down as well.  The sales plummeting seems to be caused by less customers shopping in the store and each customer is buying less products. The reason behind that could be deteriorating economic situation since it happened to all the regions around the similar time or it could be caused by poor collections of inventories. The customers were not interested in the products the company were selling. </p>

<h3>Deep Dive</h3>
<h4>Customers</h4>
<p>Maven Electronic Global Store has 11036 unique customers from 2016 to 2021. 5480 of them are female, and 5556 of them are male. According to the customer table, they are from 3 continents, 5 countries, 199 states, and 5622 cities. Over 60% of the customers come from United States; 13% from Germany; 12% from Australia; 6% from France; 5.8% from Italy. Number of Unique customers peaked in the year of 2019 with 16573 customers. Average age of customers per year ranging from 47 to 52 years old, with 2020 having the highest age of 52. Top 10 customers had purchased between 35000 and 25000 dollars, and most of them are from United States.  American Middle-aged people are the store’s main customers. It’s important to cater their needs. </p>

![image](https://github.com/user-attachments/assets/4b51f562-338c-48cf-9a49-a5ae44019532)
![image](https://github.com/user-attachments/assets/005e0958-505c-4b01-ae2d-5e87b210d9c7)
![image](https://github.com/user-attachments/assets/4dbe6644-5295-4825-a6c7-eefa33a14628)
![image](https://github.com/user-attachments/assets/b9c179fe-14d0-459b-a128-417ce8617624)
![image](https://github.com/user-attachments/assets/3c927001-3742-4001-a82c-ebe7c8e74a58)

<p>Additionally, it also has stores in other countries and also sell products online. Here is the breakdown on the unique customers count in terms of the store locations. It includes all the customers from customer table and more.   There are more customers shopping online than any other countries’ stores sale. Therefore, the company should continue to develop their ecommerce business to acquire more customers. </p>

![image](https://github.com/user-attachments/assets/ca648c61-cfb6-497c-9152-5c9b5faeaf3f)
 




<h4>Products</h4>
<p>There are 2517 total unique products from 11 brands. It covers 8 categories and 32 subcategories. Their products come in 16 different colors. The top 10 best sold products are all desktop related. The best products had a sale of 421821 dollars in total with a margin of 66%. Here is also the list of products with the highest margins. They are from Music, cell phone, and audio. </p>
 
 ![image](https://github.com/user-attachments/assets/ceb2d279-c0fe-4e5e-8a16-ff799a8417a0)
 ![image](https://github.com/user-attachments/assets/011bbe2a-7798-4f94-a6ef-1bd2b1e22305)
![image](https://github.com/user-attachments/assets/e93299ca-546c-4191-b69b-eeec9e190392)

  
 

 
<h4>Sales</h4>
<p>During the period, total sales were 55.755 million dollars. The total profit was 32.662 million dollars. The profit margin was 58.58%. The yearly sales had been peaked in 2019 of 14 million dollars. Each year, the margin had been improving, which is a good sign for the efficiency of the business. Similar to the revenue, total unique orders also peaked in 2019 with 9083 orders. The order has peaked in 2019 with 9083 orders. The data for the sale of 2021 only includes January. US has the largest sales of 23 million dollars, followed by online of 11 million, then UK of 5.7 million dollars.</p>

 
 ![image](https://github.com/user-attachments/assets/bf31e3c6-40b8-4566-90dc-9bd20e7710fc)
![image](https://github.com/user-attachments/assets/f55fd8b8-3cbe-47d5-8b50-dcc26d856a2a)
![image](https://github.com/user-attachments/assets/d651ff30-b96f-4705-9163-e4b019827cc7)

 ![image](https://github.com/user-attachments/assets/12af6002-bae2-48ba-8367-e6ddbbc97e7f)


 


<p>The best-selling brands are Adventure Works. It has a total revenue of 8.15 million dollars. However, it has a low margin of 39% comparing to its peers.  The computers category has the highest sale of 16 million dollars with a medium margin of 50%. More than one third of the purchases were made in USD. The USD purchase was 23 million dollars. Once again, American market is the company’s largest customers. </p>


 ![image](https://github.com/user-attachments/assets/bb219ae0-26a1-4c6d-be0f-20aedf72dbaa)

![image](https://github.com/user-attachments/assets/e7581aed-0c5e-4c89-a4de-0406b3d40a73)

 ![image](https://github.com/user-attachments/assets/934bf37c-5375-461d-90d3-46ef2180afcd)


 



<p>The monthly sale has pointed out March and April had the lowest sales. February and December have the highest sales. And the computers category has the most sales for each month on average. This business is highly seasonal. In terms of yearly store sales, American stores, online stors and UK have the most sales. And the sales peaked in 2019.  9 out of top 10 Customers are located in the USA. Once again, American customers are essential to the success of the business. </p>
 
![image](https://github.com/user-attachments/assets/3e81b5d9-a82d-4f1d-90f1-1d2631f071f5)
![image](https://github.com/user-attachments/assets/ef0f051f-356c-40ec-ad55-77e2df49bbdc)

![image](https://github.com/user-attachments/assets/3aa5d125-db49-414d-86be-5a321fc0c269)

 ![image](https://github.com/user-attachments/assets/d8216f9b-315b-4264-b296-c558e58b16cb)


 

 

<h4>Stores</h4>
<p>Most of the physical stores are located in the US. For online deliveries. The time it needs to take for the delivery has been reduced from 8 days in 2016 to 4 days in 2021. The efficiency of the stores has gone up. The delivery time for each county over the years had reduced simultaneously. Most of them had a delivery duration of 7 or 8 days but has a delivery duration of 4 or 5 days. 
 
 ![image](https://github.com/user-attachments/assets/37d10bdb-ef3e-49bc-8f8d-976ffb4036b9)

![image](https://github.com/user-attachments/assets/c83191d5-2b25-4ced-9f31-a8c57eab2a55)
![image](https://github.com/user-attachments/assets/9148c610-e34a-46ee-ac2d-e5d2adf79fc5)


 
<p> A quarter of the sales were made online. In total, 11.4 million dollars were made by online sales comparing to its instore sales of 44.351 million dollars. The average order values for instore purchase vs online purchase are 2138 dollars for in-stores and 2044 dollars for online purchases They are very similar. United States had the most online sales comparing to its peers with 6.1 million dollars. For yearly trends, all the country’s online sales peaked in 2019. </p>

 ![image](https://github.com/user-attachments/assets/e56cbcf7-e018-4d7e-a60d-10221b8977f9)

 ![image](https://github.com/user-attachments/assets/9cffde1b-36fa-4034-8938-6eba28507ff6)

![image](https://github.com/user-attachments/assets/ceac9274-20ba-433d-b8d5-1fde42cdad63)

 
<h3>Recommendation</h3>
<p>The business is highly seasonal and it has weak sales in the month of March and April. Therefore, the company should hire less employees or open for less hours in order to cut off unnecessary spending. The American sales had 6.1 million dollars. It’s the largest regional sales ever. The Online business ranked second place as the highest sales. It makes sense to continue to invest in online business and reach out to more customers. Try to push sales to European countries such as French, Italy since they have low sales, but high population. There are more markets to grab. The most sold brands have low margins, but high margin products don’t have top sales. Therefore, try to sell brands with high margins. The most sold category is computers category. It’s in high demand; it would make sense to sell high end computer products for a higher margin. Also, have a review of the inventory to replace them with best sellers since their sales had been coming down. </p>
<h3>Tableau Dashboard</h3>
<p>Here is the link to <a href="https://public.tableau.com/app/profile/kun.bi/viz/Maven__Electronic_Dashboard/sales_trend">the dashboard.</a>
 
![image](https://github.com/user-attachments/assets/abd8ca34-6875-4f04-b182-b85d26fe8119)

