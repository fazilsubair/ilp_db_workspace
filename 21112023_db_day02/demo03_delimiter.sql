alter table customer add COLUMN age int default 56 after sex;

-- delimiter change

delimiter //
create function countof(age int)
returns int
deterministic
begin
declare countofp int;
select count(age) into countofp from customer where customer.age>age;
return(countofp);
end//
delimiter ;


select customer_firstname ,countof(age) from customer;


select distinct countof(30) from customer;



