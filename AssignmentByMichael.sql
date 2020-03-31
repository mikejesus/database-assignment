-- Assignment submitted on 31st March, 2020 by Michael S. Olawuni

select *, (unit_price * quantity) as total_price from sql_store.order_items
where order_id = 6 and (unit_price * quantity)  > 30;


select * from sql_store.products
where quantity_in_stock in (49,38,72);
