CREATE TABLE Dish(
Dish_id CHAR(6) PRIMARY KEY CHECK(Dish_id LIKE 'DH00__'),
Name TEXT,
Cost INT,
GST INT);

INSERT INTO Dish VALUES
('DH0001','Lasagne',450,9),
('DH0002','Pizza',350,8),
('DH0003','Noodles',280,9),
('DH0004','Pudding',140,5),
('DH0005','Chicken Lollipop',200,7),
('DH0006','Mojito',90,8);

CREATE TABLE Customer(
Customer_id CHAR(6) PRIMARY KEY CHECK(Customer_id LIKE 'CS00__'),
Name TEXT,
Premium BOOLEAN);

INSERT INTO Customer VALUES
('CS0001','Shaun Gamble',True),
('CS0002','Donald Rogers',False),
('CS0003','Steve Trump',False),
('CS0004','Matt Yew',True),
('CS0005','Harry Sam',True);

CREATE TABLE Ordered_by(
Order_id CHAR(6) PRIMARY KEY CHECK(Order_id LIKE 'OR00__'),
Customer_id CHAR(6) REFERENCES Customer(Customer_id)
ON DELETE CASCADE,
Date_Of_Order DATE);

INSERT INTO Ordered_By VALUES
('OR0001','CS0002','2018-12-24'),
('OR0002','CS0005','2019-07-15'),
('OR0003','CS0001','2018-12-30'),
('OR0004','CS0003','2019-03-23'),
('OR0005','CS0005','2019-08-07'),
('OR0006','CS0004','2018-12-24'),
('OR0007','CS0003','2019-10-22'),
('OR0008','CS0005','2019-09-16');

CREATE TABLE Orders(
Order_id CHAR(6) REFERENCES Ordered_by(Order_id)
ON DELETE CASCADE,
Dish_id CHAR(6) REFERENCES Dish(Dish_id)
ON DELETE CASCADE);

INSERT INTO Orders VALUES
('OR0001','DH0002'),
('OR0001','DH0004'),
('OR0002','DH0003'),
('OR0003','DH0005'),
('OR0003','DH0001'),
('OR0003','DH0006'),
('OR0004','DH0006'),
('OR0005','DH0005'),
('OR0005','DH0003'),
('OR0006','DH0002'),
('OR0007','DH0001'),
('OR0007','DH0004'),
('OR0008','DH0003'),
('OR0008','DH0006');
