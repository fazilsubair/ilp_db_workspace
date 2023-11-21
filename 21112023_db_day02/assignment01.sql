

create procedure countSavingsAccount(out countSavings int) select count(*) into countSavings 
from customer 
inner join account on customer.customer_id= account.customer_id
inner join product on account.product_code = product.product_code
where product.product_name like 'Savings Account';


call countSavingsAccount(@countSavings);

select @countSavings;




-------------------------------------------------------------------------------


drop procedure addresscall;


create procedure addresscall(in addresin varchar(10) ) select * from  customer where address =addresin;

call addresscall('Delhi');