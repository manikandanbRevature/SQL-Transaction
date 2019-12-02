create database flipkart;
use flipkart;

create table customer(id int primary key auto_increment,
name varchar(50) not null,
mobile bigint not null unique,
mail_id varchar(50) not null unique,
address varchar(50) not null);

select * from customer;

create table categories (id int primary key auto_increment,
name varchar(50) not null unique,
type varchar(50) not null);

select * from categories;

create table product_details (id int primary key auto_increment,
name varchar(50) not null,
category_id int not null,
price int not null,
foreign key (category_id) references categories(id));

select * from product_details;

create table order_list (id int primary key auto_increment,
user_id int not null,
product_id int not null,
quantity int not null,
price int not null,
discount int not null,
foreign key (user_id) references customer(id),
foreign key (product_id) references product_details(id));

select * from order_list;

create table delivery_list (id int primary key auto_increment,
order_id int not null unique,
status varchar(50) not null,
foreign key (order_id) references order_list(id));

select * from delivery_list;



