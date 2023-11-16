--  create database  

create database Bank_db;


show database;


--  use database 

use Bank_db;

-- create table 

create table customer(customer_id varchar(10) not null primary key,customer_firstname varchar(15) not null,customer_lastname varchar(15),address varchar(20)not null , phnumber bigint not null,adharcard_no bigint not null);



--  show tables 

show tables;

-- insert data into table  

insert into customer values('CSS0000001','Parul','Gandhi','Delhi',7863452678,222233334444);
insert into customer values('CSS0000002','Chitresh','Kumar','Mumbai',7863452679,222233334445);
insert into customer values('CSS0000003','Nisha','Shankar','Mumbai',7863452610,222233334446);
insert into customer values('CSS0000004','Abhishek','Dutta','Mumbai',7863452611,222233334447);
insert into customer values('CSS0000005','Shankar','Nair','Mumbai',7863452612,222233334448);



-- show data in tables 
select * from customer;


-- create product table
CREATE TABLE product(product_code VARCHAR(10) not NULL PRIMARY KEY,product_name VARCHAR(10) not NULL );

-- alter table 

ALTER TABLE product ALTER COLUMN product_name VARCHAR (30) NOT NULL;



-- inset data into product

INSERT into product values('PC0000001','Savings Account');
INSERT into product values('PC0000002','Current Account');
INSERT into product values('PC0000003','Rural Account');
INSERT into product values('PC0000004','Women Savings Account');
INSERT into product values('PC0000005','Loan Account');
INSERT into product values('PC0000006','Max Savings Account');



-- create account table

create table account(accout_no varchar(10) not null primary key, customer_id varchar(10) not null, product_code varchar(10) not null, foreign key(customer_id) references customer(customer_id),foreign key(product_code) references product(product_code));


-- inset into account


insert into account values('ACC0000001','CSS0000001','PC00000001');
insert into account values('ACC0000002','CSS0000002','PC00000002');
insert into account values('ACC0000003','CSS0000003','PC00000003');
insert into account values('ACC0000004','CSS0000004','PC00000004');
insert into account values('ACC0000005','CSS0000005','PC00000005');
 


--  create table service


create table service(service_code varchar(10) not null PRIMARY key , service_name varchar(30) not null);


-- insert into service

insert into service values('SC00000001','Cash Deposit');
insert into service values('SC00000002','Cash Withdrawl');
insert into service values('SC00000003','ATM Deposit');
insert into service values('SC00000004','ATM Withdrawl');
insert into service values('SC00000005','Cheque Book');


-- create table productservicemapping

create table productservicemapping(mapping_id varchar(10) not null primary key , product_code varchar(10) not null, service_code varchar(10) not null , foreign key (product_code) references product(product_code),foreign key (service_code) references service(service_code));

-- insert into productservicemapping 



INSERT INTO productservicemapping VALUES
('MC0000001', 'PC0000001', 'SC00000001'),
('MC0000002', 'PC0000001', 'SC00000002'),
('MC0000003', 'PC0000001', 'SC00000004'),
('MC0000004', 'PC0000002', 'SC00000001'),
('MC0000005', 'PC0000002', 'SC00000002'),
('MC0000006', 'PC0000002', 'SC00000004'),
('MC0000007', 'PC0000002', 'SC00000005'),
('MC0000008', 'PC0000003', 'SC00000001'),
('MC0000009', 'PC0000003', 'SC00000002');



-- create table transaction

create table transaction(transaction_code varchar(10) not null primary key,product_code varchar(10) not null,service_code varchar(10) not null,dateoftransaction timestamp not null, volume int not null);



-- insert into transaction


INSERT INTO transaction 
VALUES
('TC000001', 'PC0000001', 'SC00000001', STR_TO_DATE('Tue Nov 16 19:32:18 2021', '%a %b %d %H:%i:%s %Y'), 60000000),
('TC000002', 'PC0000001', 'SC00000002', STR_TO_DATE('Tue Dec 28 21:21:30 PST 2021', '%a %b %d %H:%i:%s PST %Y'), 87654433),
('TC000003', 'PC0000001', 'SC00000004', STR_TO_DATE('Wed Dec 29 18:16:34 PST 2021', '%a %b %d %H:%i:%s PST %Y'), 788888888),
('TC000004', 'PC0000002', 'SC00000001', STR_TO_DATE('Mon Dec 27 15:16:34 PST 2021', '%a %b %d %H:%i:%s PST %Y'), 7986554),
('TC000005', 'PC0000002', 'SC00000002', STR_TO_DATE('Tue Nov 16 23:10:49 PST 2021', '%a %b %d %H:%i:%s PST %Y'), 366666666),
('TC000006', 'PC0000003', 'SC00000002', STR_TO_DATE('Thu Nov 18 13:52:18 PST 2021', '%a %b %d %H:%i:%s PST %Y'), 608654400);
