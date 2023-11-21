
-- autocommiting each code check

show variables where  variable_name = 'autocommit';


-- updation or deletion anomily where if a table is linked to another using foreing key we cant delete the table so we have to use  on delete & restrict



insert into customer value('CSS0000007','dencymol','babay','F','kerala','1234567890','0987654321');



delete from customer where customer_id='CSS0000007';


set autocommit= off;
set autocommit= on;


