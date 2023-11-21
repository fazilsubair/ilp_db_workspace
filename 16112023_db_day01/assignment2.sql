


select customer.customer_firstname, account.accout_no,product.product_name from customer 
inner join account on customer.customer_id= account.customer_id
inner join product on account.product_code = product.product_code
where product.product_name like 'Savings Account';





select customer.customer_id, CONCAT(customer.customer_firstname, ' ', customer.customer_lastname) AS customer_name, account.accout_no, product.product_code, product.product_name ,productservicemapping.mapping_id,productservicemapping.service_code,service.service_name
from customer
inner join account on account.customer_id = customer.customer_id 
inner join product on account.product_code=product.product_code
inner join productservicemapping on productservicemapping.product_code=product.product_code
inner join service on service.service_code= productservicemapping.service_code
where customer.customer_firstname like 'Parul';



select product.product_code, product.product_name, transaction.transaction_code,transaction.volume
from product
inner join transaction on product.product_code = transaction.product_code
where transaction.volume = (select max(volume) from transaction);