-- alter table customer add sex

alter table customer add COLUMN sex char(1) default 'M' after customer_lastname;


-- change sex value 


update customer set sex='F' where customer_id="CSS0000001";
update customer set sex='F' where customer_id="CSS0000003";



-- DQl 

-- display customer name in descending order
select * from customer order by customer_firstname desc;

-- display customer who resides in mumbai 
select * from customer where address='Mumbai';

-- display customer who residers in mumbai and delhi 
select * from customer where address in ('Mumbai','Delhi');

-- display customer whos name starts withe A 
select * from customer where customer_firstname like 'A%';



-- display customer with max volume

select max(volume) from transaction;

select * from transaction where volume = (select max(volume) from transaction);



-- creating view

create view ProductDetails as select product_code,service_code from transaction where volume = ( select max(volume) from transaction);


select * from ProductDetails;


-- joins

select customer.customer_firstname, account.accout_no from customer inner join account on customer.customer_id= account.customer_id;



insert into customer values('CSS0000006','Aaron','Paul','M','Kerala',7863452613,222233334449);


select customer.customer_firstname, account.accout_no from customer left join account on customer.customer_id= account.customer_id;



select customer.customer_firstname, account.accout_no from customer left join account on customer.customer_id= account.customer_id;