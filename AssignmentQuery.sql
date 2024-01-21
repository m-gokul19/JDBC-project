create database Ecommerce;
use Ecommerce;
create table supplier(
	SUPP_ID int primary key,
    SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL
);
select*from supplier;

CREATE table customer(
	CUS_ID INT primary KEY,
    CUS_NAME varchar(20) NOT NULL,
    CUS_PHONE varchar(10) NOT null,
    CUS_CITY varchar(30) NOT NULL,
    CUS_GENDER char
);
select*FROM CUSTOMER;

create table category(
	CAT_ID INT primary KEY,
    CAT_NAME varchar(20) NOT NULL
);
SELECT*FROM CATEGORY;

create TABLE PRODUCT(
	PRO_ID INT primary key,
    PRO_NAME varchar(20) NOT NULL default "DUMMY",
    PRO_DESC varchar(60),
    CAt_ID int,
	foreign key(CAT_ID) references category(CAt_ID)
);
select*from product;

create table supplier_pricing(
	PRICING_ID INT primary KEY,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT default 0,
    foreign key(PRO_ID) references PRODUCT(PRO_ID),
    foreign key(SUPP_ID) references supplier(SUPP_ID)
);
select*from supplier_pricing;

CREATE table orders(
	ORD_ID INT primary KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT null,
    CUS_ID INT,
    PRICING_ID INT,
    foreign key(CUS_ID) references CUSTOMER(CUS_ID),
    foreign key(PRICING_ID) references SUPPLIER_PRICING(PRICING_ID)
);
select*from orders;

create table rating(
	RAT_ID INT primary KEY,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    foreign key(ORD_ID) references ORDERS(ORD_ID)
);
insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values
	(1,'Rajesh Retails','Delhi',1234567890),
    (2,'Appario Ltd','Mumbai',2589631470),
    (3,'Knome products','Banglore',9785462315),
    (4,'Bansal Retails','kochi',8975463285),
    (5,'Mittal Ltd.','Lucknow',7898456532);
    
    select*from supplier;
    
insert into customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values
	(1,'AAKASH',9999999999,'DELHI', 'M'),
    (2,'AMAN',9785463215, 'NOIDA','M'),
    (3, 'NEHA',9999999999,'MUMBAI', 'F'),
    (4 ,'MEGHA',9994562399, 'KOLKATA', 'F'),
    (5,' PULKIT',7895999999,'LUCKNOW','M');

insert into category(CAT_ID,CAT_NAME) values
	(1,'BOOKS'),
    (2,'GAMES'),
	(3,'GROCERIES'),
	(4,'ELECTRONICS'),
	(5,'CLOTHES');

insert into product() values
	(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2),
	(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5),
	(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4),
	(4,'OATS','Highly Nutritious from Nestle',3),
	(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1),
	(6,'MILK','1L Toned MIlk',3),
	(7,'Boat Earphones','1.5Meter long Dolby Atmos',4),
	(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5),
	(9,'Project IGI','compatible with windows 7 and above',2),
	(10,'Hoodie','Black GUCCI for 13 yrs and above',5),
	(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1),
	(12,'Train Your Brain','By Shireen Stephen',1);

insert into supplier_pricing() values
	(1,1,2,1500),
	(2,3,5,30000),
	(3,5,1,3000),
	(4,2,3,2500),
	(5,4,1,1000),
	(6,12,2,780),
	(7,12,4,789),
	(8,3,1,31000),
	(9,1,5,1450),
	(10,4,2,999),
	(11,7,3,549),
	(12,7,4,529),
	(13,6,2,105),
	(14,6,1,99),
	(15,2,5,2999),
	(16,5,2,2999);

insert into orders() values
	(101,1500,'2021-10-06',2,1),
	(102,1000,'2021-10-12',3,5),
	(103,30000,'2021-09-16',5,2),
	(104,1500,'2021-10-05',1,1),
	(105,3000,'2021-08-16',4,3),
	(106,1450,'2021-08-18',1,9),
	(107,789,'2021-09-01',3,7),
	(108,780,'2021-09-07',5,6),
	(109,3000,'2021-01-10',5,3),
	(110,2500,'2021-09-10',2,4),
	(111,1000,'2021-09-15',4,5),
	(112,789,'2021-09-16',4,7),
	(113,31000,'2021-09-16',1,8),
	(114,1000,'2021-09-16',3,5),
	(115,3000,'2021-09-16',5,3),
	(116,99,'2021-09-17',2,14);
    
insert into rating() values
	(1,101,4),
	(2,102,3),
	(3,103,1),
	(4,104,2),
	(5,105,4),
	(6,106,3),
	(7,107,4),
	(8,108,4),
	(9,109,3),
	(10,110,5),
	(11,111,3),
	(12,112,4),
	(13,113,2),
	(14,114,1),
	(15,115,1),
	(16,116,0);

	/*total number of customers based on gender*/
select count(cus_gender) as Total_no_of_customerOrders_above_3000,cus_gender from customer inner join orders on orders.ord_amount>=3000 group  by cus_gender;

	/*Display all the orders along with product name ordered by a customer having Customer_Id=2*/
select  orders.*,product.pro_name from orders  join product on orders.ord_id=orders.ord_id where orders.cus_id=2;

	/*Display the Supplier details who can supply more than one product.*/

select supplier.* from supplier join supplier_pricing on supplier.supp_id=supplier_pricing.supp_id group by supplier.supp_id having count(distinct supplier_pricing.pro_id)>1;

/*Create a view as lowest_expensive_product and display the least expensive product from each category and print the table
with category id, name, product name and price of the product.*/

select * from lowest_expensive_product;

/*Display the Id and Name of the Product ordered after “2021-10-05”*/

SELECT DISTINCT product.PRO_ID, product.PRO_NAME
FROM product 
JOIN supplier_pricing  ON product.PRO_ID = supplier_pricing.PRO_ID
JOIN orders  ON supplier_pricing.PRICING_ID = orders.PRICING_ID
WHERE orders.ORD_DATE > '2021-10-05';

/*Display customer name and gender whose names start or end with character 'A'*/

SELECT cus_name, cus_gender
FROM customer
WHERE cus_name LIKE 'A%' OR cus_name LIKE '%A';

/* Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print
“Average Service” else print “Poor Service”. Note that there should be one rating per supplier.*/

call GetSupplierRatingAndServiceType() ;
