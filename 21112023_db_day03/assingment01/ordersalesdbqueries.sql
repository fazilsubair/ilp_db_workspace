create database if not exists ordersalesdb;

use ordersalesdb;

create table if not exists productlines(
     productLine varchar(15) not null,
     textDescription text, 
     htmlDescription text not null, 
     image varchar(255), 
     primary key (productLine)
 ) ;

 create table if not exists products(
     productCode varchar(15) not null primary key,
     productName varchar(255) not null,
     productLine varchar(15) not null,
     productScale int not null,
     productVendor varchar(255),
     productDescription text,
     quantityInStock varchar(255),
     buyPrice decimal(15, 2) not null, 
     MSRP varchar(255), 
     foreign key fk_productlines(productLine)
     references productlines(productLine)
     on update cascade
     on delete restrict
 );

create table if not exists orderdetails(
     orderNumber int not null, 
     productCode varchar(20) not null, 
     quantityOrdered varchar(255), 
     priceEach decimal(15, 2) not null,
     orderLineNumber int, 
     primary key (orderNumber, productCode)
 );

create table if not exists orders(
     orderNumber int auto_increment not null primary key, 
     orderDate date, 
     requiredDate date, 
     shippedDate date, 
     status text, 
     comments text, 
     customerNumber int not null,
     foreign key fk_customers(customerNumber) 
     references customers(customerNumber)
     on update cascade
     on delete restrict
 ) engine = innodb;

create table if not exists customers(
     customerNumber int not null auto_increment primary key,
     customerName varchar(255), 
     contactLastName varchar(255), 
     contactFirstName varchar(255), 
     phone varchar(15), 
     addressLine1 varchar(255), 
     addressLine2 varchar(255), 
     city varchar(255), 
     state varchar(255), 
     postalCode varchar(255),
     country varchar(100), 
     salesRepEmployeeNumber int not null, 
     creditLimit decimal(15, 2), 
     foreign key fk_employees(salesRepEmployeeNumber)
     references employees(employeeNumber)
     on update cascade 
     on delete restrict
 ) engine = innodb;

create table payments(
     customerNumber int not null auto_increment, 
     checkNumber int not null, 
     paymentDate date, 
     amount decimal(15, 2),
     primary key(customerNumber, checkNumber)
 );

create table offices(
     officeCode int auto_increment not null primary key,
     city varchar(255), 
     phone varchar(15), 
     addressLine1 varchar(255), 
     addressLine2 varchar(255), 
     country varchar(100),      
     postalCode varchar(255),
     territory varchar(255)
 );

create table if not exists employees(
     employeeNumber int auto_increment not null primary key, 
     lastName varchar(255), 
     firstName varchar(255), 
     extension varchar(255), 
     email varchar(100), 
     officeCode int not null, 
     reportsTo int , 
     jobTitle varchar(255), 
     foreign key fk_offices(officeCode)
     references offices(officeCode)
     on update cascade
 ) engine = innodb;

