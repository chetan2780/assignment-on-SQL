create database assignment;
	use assignment;
	create table salespeople (snum int not null,
	sname varchar(30) unique,
	city varchar(30),
	comm int,
	primary key(snum));
	
	desc salespeople;
	
	create table customers (cnum int not null,
	cname varchar(30),
	city varchar(30) not null,
	snum int not null,
	primary key(cnum),
	foreign key(snum) references salespeople(snum)
	);
	desc customers;
	
	create table orders (onum int not null,
	amt float, 
	odate date, 
	cnum int not null,
	snum int not null, 
	primary key(onum),
	foreign key(cnum) references customers(cnum),
	foreign key(snum) references salespeople(snum)
	);
	desc orders;
	
	insert into salespeople (snum,sname,city,comm)
	values (1001,'Peel','London',12),
			(1002,'Serres','Sanjose',13),
	        (1004,'Motika','London',11),
	        (1007,'Rifkin','Barcelona',15),
	        (1003,'Axelrod','Nework',10);
	select * from salespeople;
	
	insert into customers (cnum,cname,city,snum)
	values (2001,'Hoffman','London',1001),
			(2002,'Giovanni','Rome',1003),
	        (2003,'Liu','Sanjose',1002),
	        (2004,'Grass','Berlin',1002),
	        (2006,'Clemens','London',1001),
	        (2008,'Cisneros','Sanjose',1007),
	        (2007,'Pereira','Rome',1004);
	select * from customers;
	
	insert into orders (onum,amt,odate,cnum,snum)
	values (3001,18.69,'1990-10-03',2008,1007),
			(3003,767.19,'1990-10-03',2001,1001),
	        (3002,1900.10,'1990-10-03',2007,1004),
	        (3005,5160.45,'1990-10-03',2003,1002),
	        (3006,1098.16,'1990-10-03',2008,1007),
	        (3009,1713.23,'1990-10-04',2002,1003),
	        (3007,75.75,'1990-10-04',2004,1002),
	        (3008,4273.00,'1990-10-05',2006,1001),
	        (3010,1309.95,'1990-10-06',2004,1002),
	        (3011,9891.88,'1990-10-06',2006,1001);
	select * from orders;
	select * from salespeople;
	select * from customers;
	-- 1. Count the number of Salesperson whose name begin with ‘a’/’A’.
	
	select count(sname) 
	from salespeople 
	where sname like 'A%';
	
	-- 2. Display all the Salesperson whose all orders worth is more than Rs. 2000.
	
	select s.sname,s.city,o.amt,o.odate
	from salespeople as s inner join orders as o 
	on s.snum = o.snum
	where amt >2000.0;
	
	--  Count the number of Salesperson belonging to Newyork
	select count(sname)
	from salespeople 
	where city = 'Nework'; 
	
	--   Display the number of Salespeople belonging to London and belonging to Paris.
	select * 
	from salespeople
	where city = 'London' or city = 'Paris';     -- we dont have any salesperson belonging london and peris that why i use or for both place.
	
	-- Display the number of orders taken by each Salesperson and their date of orders.
	select count(odate), o.odate, s.sname,s.city
	from orders as o left outer join salespeople as s 
	on o.snum = s.snum
	group by odate;