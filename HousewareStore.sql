use HousewareStore

CREATE TABLE Category(
	[category_id] int primary key IDENTITY(1,1) NOT NULL,
	[category_name] nvarchar(255) NOT NULL
);

create table Products(
	[product_id] int IDENTITY(1,1) NOT NULL primary key,
	[category_id] int NOT NULL,
	[product_name] nvarchar(max) NOT NULL,
	[product_describe] nvarchar(max) NULL,
	[UnitPrice] float NOT NULL,
	[QuantityRemaining] int NULL,
	[QuantitySold] int NULL,
	[img] nvarchar(max) NULL,
	FOREIGN KEY ([category_id]) REFERENCES Category([category_id])
);

CREATE TABLE Users (
	[user_id] int IDENTITY(1,1) NOT NULL,
	[username] nvarchar(100) PRIMARY KEY NOT NULL,
	[password] nvarchar(255) NOT NULL,
	[fullName] nvarchar(100) NULL,
	[user_email] nvarchar(255) NULL,
	[user_phone] bigint NULL,
	[BirthDay] date NULL,
	[user_address] nvarchar(50) NULL,
	[role] int NOT NULL,
	[image] nvarchar(50) NULL,
);

CREATE TABLE Orders(
	[order_id] int primary key IDENTITY(1,1) NOT NULL,
	[username] nvarchar(100) NOT NULL,
	[total] money NOT NULL,
	[date] date NULL,
	FOREIGN KEY ([username]) REFERENCES Users([username])
);

CREATE TABLE Order_Details(
	[order_id] int NOT NULL,
	[product_id] int NOT NULL,
	[quantity] int NOT NULL,
	[price] money NOT NULL,
	CONSTRAINT [PK_OrderDetail] PRIMARY KEY ([order_id], [product_id] ),
	FOREIGN KEY ([order_id]) REFERENCES Orders([order_id]),
	FOREIGN KEY ([product_id]) REFERENCES Products([product_id])
);


CREATE TABLE Cart(
	[username] nvarchar(100) NOT NULL,
	[product_id] int NOT NULL,
	[product_name] nvarchar(255) NULL,
	[product_img] nvarchar(255) NULL,
	[product_price] money NULL,
	[quantity] int NOT NULL,
	[total] money NOT NULL,
	CONSTRAINT [PK_Cart] PRIMARY KEY ([product_id], [username]),
	FOREIGN KEY ([product_id]) REFERENCES Products([product_id]),
	FOREIGN KEY ([username]) REFERENCES Users([username])
);

drop table Cart

create database HousewareStore

use master
drop database HousewareStore

SELECT * FROM Users where [username] like '%user%'

SELECT Top 1 [order_id] FROM [Orders] ORDER BY [order_id] DESC

select * from Order_Details

select d.order_id, p.product_id, p.product_name, p.img, d.quantity, d.price from Order_Details d inner join Products p on d.product_id = p.product_id where d.order_id = 1

select top 1 order_id, total, date from [Orders] order by order_id desc

select * from [Orders]

select b.order_id, u.username, u.user_phone, u.user_address, b.date, b.total from Orders b inner join Users u on b.username = u.username

select d.order_id, p.product_id, d.quantity, d.price from Order_Details d inner join Products p on d.product_id = p.product_id where d.order_id = 1

INSERT INTO Order_Details ([order_id], [product_id], [quantity], [price])VALUES (5,5,1,4990000)

SELECT * FROM [dbo].[Cart]

delete from Cart where product_id = 1 and username = 'admin'

SELECT SUM(product_price) as total FROM Cart WHERE username = 'admin' GROUP BY username;

select d.order_id, p.product_id, d.quantity, d.price from Order_Details d inner join Products p on d.product_id = p.product_id where d.order_id = 6

SELECT TOP 5 u.username, o.order_id, SUM(o.total) AS total_spent, o.date 
FROM Users u LEFT JOIN Orders o 
ON o.username = u.username 
GROUP BY u.username, o.order_id, [role], o.date 
HAVING [role] = 2
ORDER BY total_spent DESC;

select * from Users

select * from Cart

UPDATE Cart
SET quantity = 2
WHERE username = 'dyann' AND product_id = 1;

Select * from Cart c inner join Products p on c.product_id = p.product_id where username = 'admin' AND c.product_id = 1;

SELECT SUM(product_price * quantity) as total FROM Cart WHERE username = 'dyann' GROUP BY username

SELECT * FROM [dbo].[Cart] where [username] = 'dyann'

delete from Cart where username = 'dyann'

select * from Cart where product_id = 2 and username = 'admin'

select * from Orders

select QuantityRemaining from Products where product_id = 1

select * from Products 

UPDATE Products
SET QuantityRemaining = (select QuantityRemaining from Products where product_id = 2) + 500
WHERE product_id = 2;

select QuantitySold from Products where product_id = 1