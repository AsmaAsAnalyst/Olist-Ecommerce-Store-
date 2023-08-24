use olist2;



select count(*) from olist_customers_dataset;

select count(*) from olist_orders_dataset;

select count(*) from olist_order_items_dataset;

select count(*) from olist_order_payments_dataset;

select count(*) from olist_order_reviews_dataset;

select count(*) from olist_products_dataset;

select count(*) from olist_sellers_dataset;

select count(*) from olist_geolocation_dataset;

select count(*) from product_category_name_translation;


-- Weekday Vs Weekend Payments

select * from olist_orders_dataset;

select * from olist_order_payments_dataset;

create table KPI1
select  o.day_name, round(sum(p.payment_value),2) from olist_orders_dataset as o left join olist_order_payments_dataset as p
on o.order_id=p.order_id group by o.day_name;

-- Orders with Review Score 5 & payment as Credit card

select * from olist_order_reviews_dataset;


select * from olist_order_payments_dataset;


create table KPI2 
select p.payment_type, r.review_score ,count(o.order_id) as No_of_orders from olist_orders_dataset as o left join olist_order_payments_dataset as p on o.order_id = p.order_id
left join olist_order_reviews_dataset as r on o.order_id = r.order_id 
where p.payment_type ='credit_card' and r.review_score =5;


-- Average Delivery Days for Pet shop products


select * from olist_orders_dataset;

select * from olist_products_dataset;

select * from olist_order_items_dataset;


create table KPI3 
select p.product_category_name , round(avg(o.days_diff)) as Avg_days_taken from olist_orders_dataset as o left join olist_order_items_dataset as i 
on o.order_id = i.order_id left join olist_products_dataset as p on i.product_id = p.product_id 
where p.product_category_name ='pet_shop';

-- Average Price & Payment values of customers in Sao Paulo city


select * from olist_order_payments_dataset;

select * from olist_order_items_dataset;

select * from olist_customers_dataset;

select * from olist_orders_dataset;


create table KPI4
select c.customer_city, round(avg(i.price)), round(avg(p.payment_value)) from olist_orders_dataset as o left join olist_customers_dataset as c on
o.cust_id = c.customer_id left join olist_order_items_dataset as i on o.order_id = i.order_id left join
olist_order_payments_dataset as p on o.order_id = p.order_id where c.customer_city ='sao paulo';



-- Shipping days vs Review score
create table KPI5
select r.review_score, round(avg(o.days_diff)) as Shipping_Days from olist_orders_dataset as o left join olist_order_reviews_dataset as r on 
o.order_id = r.order_id where r.review_score is not null group by r.review_score order by r.review_score asc ;

