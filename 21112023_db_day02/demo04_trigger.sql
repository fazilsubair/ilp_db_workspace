
CREATE TABLE transaction_log (
    serial_no INT AUTO_INCREMENT PRIMARY KEY,
    transaction_code VARCHAR(10),
    change_date DATE
);





delimiter $$
create trigger after_transaction_insert
after insert on transaction
for each row
begin
insert into transaction_log(transaction_code,change_date)
values(new.transaction_code,now());

end$$

delimiter;


insert into transaction values('TC000007','PC0000004','SC00000002',Now(),'600');