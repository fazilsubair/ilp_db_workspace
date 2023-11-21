alter table customer add COLUMN category varchar(15) default 'Normal' after age;




delimiter //
create function categoryof()
returns varchar(15)
deterministic
begin
update customer set category ='Senior' where customer.age>55;
update customer set category = 'Adult' where customer.age<55;
returns category
end//
delimiter ;

select customer_firstname ,countof(age) from customer;



DELIMITER //

CREATE FUNCTION UpdateCustomerCategory()
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    UPDATE customer
    SET category = 'Senior'
    WHERE age > 55;

    UPDATE customer
    SET category = 'Adult'
    WHERE age <= 55;

    RETURN 'Categories updated successfully.';
END //

DELIMITER ;

SELECT UpdateCustomerCategory();
