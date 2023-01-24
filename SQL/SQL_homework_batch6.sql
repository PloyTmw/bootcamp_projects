-- Thai Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery/ with

-- CREATE TABLE menu
CREATE TABLE menu (
  menu_id INT NOT NULL PRIMARY KEY,
  menu_name VARCHAR (30),
  menu_price NUMERIC
);

INSERT INTO menu VALUES
  (1001,'Pad Thai',50),
  (1002,'Tom Yum Goong',60),
  (1003,'Glass Noodle Salad',50),
  (1004,'Khao Pad Poo',70),
  (1005,'Khao Man Kai',40),
  (1006,'Tom Kha Kai',40),
  (1007,'Gaeng Keow Wan Kai',40),
  (1008,'Khao Pad Kung',60),
  (1009,'Chiang Mai Noodles',50),
  (2001,'Drinking Water',15),
  (2002,'Roselle Juice',20),
  (2003,'Longan Juice',20),
  (2004,'Pandan Juice',20),
  (2005,'Coconut Milk Shake',35),
  (3001,'Med Khanun',20),
  (3002,'Foi Thong',20),
  (3003,'Khanun Tom',20),
  (3004,'Kanom Sai Sai',20),
  (3005,'Tub Tim Krob',20);

-- CREATE TABLE employees
CREATE TABLE employees (
  employee_id VARCHAR NOT NULL PRIMARY KEY,
  firstname VARCHAR(30),
  lastname VARCHAR(30),
  title VARCHAR(40),
  birthdate DATE,
  hiredate DATE,
  province VARCHAR(200),
  email VARCHAR(60)  
);

INSERT INTO employees VALUES
  ('EM0001','Pigun','Tong','Part time','2000-03-01','2020-09-21','Chachoengsao','piguntong_em0001@gmail.com'),
  ('EM0002','Tubtim','Dang','Part time','1998-12-18','2020-12-16','Nakhon Pathom','tubtimdang_em0002@gmail.com'),
  ('EM0003','Som','Siri','Part time','2000-12-22','2020-04-11','Samutprakarn','somsiri_em0003@gmail.com'),
  ('EM0004','Mali','Ban','Chef','1989-06-28','2020-12-07','Phayao','maliban_em0004@gmail.com'),
  ('EM0005','Mapraw','Namhom','Chef','1988-11-03','2020-01-08','Prachinburi','maprawnamhom_em0005@gmail.com'),
  ('EM0006','Meetang','Ginkwaw','Chef','1986-09-07','2020-07-01','Nan','meetangginkwaw_em0006@gmail.com');

-- CREATE TABLE customers
CREATE TABLE customers(
  customer_id VARCHAR NOT NULL PRIMARY KEY,
  firstname VARCHAR(30),
  lastname VARCHAR(30),
  province VARCHAR(100),
  region VARCHAR(60),
  phone VARCHAR(20)
);

INSERT INTO customers VALUES
  ('CS00001','Frederique','Citeaux','Chumphon','Southern','067-186-3939'),
  ('CS00002','Rita','Muller','Nong Bua Lamphu','Northeastern','061-753-5949'),
  ('CS00003','Jose','Pavarotti','Trang','Southern','062-611-5943'),
  ('CS00004','Patricia','McKenna','Chiang Rai','Northern','068-462-2761'),
  ('CS00005','Helen','Bennett','Sisaket','Northeastern','065-627-4115'),
  ('CS00006','Mary','Saveley','Prachuap Khiri Khan','Western','067-398-9151'),
  ('CS00007','Mario','Pontes','Nan','Northern','064-446-5964'),
  ('CS00008','Pedro','Afonso','Krabi','Southern','066-591-6386'),
  ('CS00009','Liz','Nixon','Ranong','Southern','062-639-2868'),
  ('CS00010','Christina','Berglund','Bangkok','Central','063-573-4151'),
  ('CS00011','Manuel','Pereira','Phang Nga','Southern','069-479-1283'),
  ('CS00012','Carlos','Hernandez','Ubon Ratchathani','Northeastern','068-221-4242'),
  ('CS00013','Pascale','Cartrain','Phetchaburi','Western','062-876-5291'),
  ('CS00014','Philip','Cramer','Chonburi','Eastern','065-477-6611'),
  ('CS00015','Francisco','Chang','Ranong','Southern','066-648-6759'),
  ('CS00016','Alejandra','Camino','Sa Kaeo','Eastern','069-593-2792'),
  ('CS00017','Paul','Henriot','Tak','Western','066-743-6786'),
  ('CS00018','Art','Braunschweiger','Prachuap Khiri Khan','Western','064-984-4833'),
  ('CS00019','Anabela','Domingues','Ratchaburi','Western','069-569-8195'),
  ('CS00020','Janine','Labrune','Trat','Eastern','065-217-9264'),
  ('CS00021','Jose','Pedro','Trang','Southern','068-961-9434'),
  ('CS00022','Ana','Trujillo','Phrae','Northern','065-551-7443'),
  ('CS00023','Miguel','Angel','Prachinburi','Eastern','064-162-7193'),
  ('CS00024','Victoria','Ashworth','Ratchaburi','Western','065-491-8984'),
  ('CS00025','Matti','Karttunen','Lampang','Northern','061-911-1998'),
  ('CS00026','Karl','Jablonski','Kamphaeng Phet','Central','064-648-5651'),
  ('CS00027','Yang','Wang','Phayao','Northern','061-857-8311');

-- CREATE TABLE orders
CREATE TABLE orders (
  order_id INT NOT NULL PRIMARY KEY,
  invoice_id INT NOT NULL,
  menu_id INT NULL,
  menu_price NUMERIC,
  quantity INT,
  employee_id VARCHAR,
  customer_id VARCHAR,
  FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
  FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
  FOREIGN KEY (menu_price) REFERENCES menu(menu_price),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
  (1,1,1002,60,1,'EM0005',NULL),
  (2,1,1003,50,1,'EM0005',NULL),
  (3,1,2004,20,1,'EM0006',NULL),
  (4,1,2002,20,1,'EM0006',NULL),
  (5,1,3004,20,1,'EM0004',NULL),
  (6,1,3001,20,1,'EM0004',NULL),
  (7,2,1003,50,1,'EM0006','CS00009'),
  (8,2,2005,35,1,'EM0004','CS00009'),
  (9,2,NULL,NULL,0,NULL,NULL),
  (10,3,1002,60,1,'EM0005','CS00023'),
  (11,3,1009,50,1,'EM0004','CS00023'),
  (12,3,2003,20,1,'EM0004','CS00023'),
  (13,3,2001,15,1,'EM0006','CS00023'),
  (14,3,3005,20,1,'EM0005','CS00023'),
  (15,3,3001,20,1,'EM0005','CS00023'),
  (16,4,1008,60,1,'EM0005','CS00006'),
  (17,4,1002,60,1,'EM0006','CS00006'),
  (18,4,1006,40,1,'EM0004','CS00006'),
  (19,4,2004,20,1,'EM0006','CS00006'),
  (20,4,2002,20,1,'EM0006','CS00006'),
  (21,4,2001,15,1,'EM0004','CS00006'),
  (22,4,3002,20,1,'EM0005','CS00006'),
  (23,4,3002,20,1,'EM0005','CS00006'),
  (24,4,3003,20,1,'EM0004','CS00006'),
  (25,5,1009,50,1,'EM0004','CS00013'),
  (26,5,1006,40,1,'EM0006','CS00013'),
  (27,5,1002,60,1,'EM0005','CS00013'),
  (28,5,2004,20,1,'EM0004','CS00013'),
  (29,5,2002,20,1,'EM0005','CS00013'),
  (30,5,2004,20,1,'EM0004','CS00013'),
  (31,5,3001,20,1,'EM0006','CS00013'),
  (32,5,3004,20,1,'EM0006','CS00013'),
  (33,5,NULL,NULL,0,NULL,NULL),
  (34,6,1004,70,1,'EM0004','CS00007'),
  (35,6,1006,40,1,'EM0005','CS00007'),
  (36,6,1009,50,1,'EM0006','CS00007'),
  (37,6,2003,20,1,'EM0005','CS00007'),
  (38,6,2004,20,1,'EM0005','CS00007'),
  (39,6,2004,20,1,'EM0005','CS00007'),
  (40,6,3002,20,1,'EM0006','CS00007'),
  (41,6,3005,20,1,'EM0005','CS00007'),
  (42,6,3004,20,1,'EM0005','CS00007'),
  (43,7,1004,70,1,'EM0004','CS00010'),
  (44,7,1003,50,1,'EM0004','CS00010'),
  (45,7,1001,50,1,'EM0004','CS00010'),
  (46,7,2005,35,1,'EM0004','CS00010'),
  (47,7,2003,20,1,'EM0006','CS00010'),
  (48,7,2001,15,1,'EM0005','CS00010'),
  (49,7,3005,20,1,'EM0005','CS00010'),
  (50,7,3004,20,1,'EM0004','CS00010'),
  (51,7,3003,20,1,'EM0005','CS00010'),
  (52,8,1004,70,1,'EM0004','CS00014'),
  (53,8,2002,20,1,'EM0004','CS00014'),
  (54,8,3005,20,1,'EM0006','CS00014'),
  (55,9,1006,40,1,'EM0006',NULL),
  (56,9,1009,50,1,'EM0004',NULL),
  (57,9,1001,50,1,'EM0005',NULL),
  (58,9,2004,20,1,'EM0005',NULL),
  (59,9,2003,20,1,'EM0006',NULL),
  (60,9,2003,20,1,'EM0004',NULL),
  (61,9,3002,20,1,'EM0005',NULL),
  (62,9,NULL,NULL,0,NULL,NULL),
  (63,9,3004,20,1,'EM0004',NULL),
  (64,10,1008,60,1,'EM0006','CS00020'),
  (65,10,1009,50,1,'EM0006','CS00020'),
  (66,10,2004,20,1,'EM0005','CS00020'),
  (67,10,2002,20,1,'EM0004','CS00020'),
  (68,10,3003,20,1,'EM0006','CS00020'),
  (69,10,3002,20,1,'EM0006','CS00020'),
  (70,11,1009,50,1,'EM0005','CS00001'),
  (71,11,1008,60,1,'EM0006','CS00001'),
  (72,11,2005,35,1,'EM0005','CS00001'),
  (73,11,2002,20,1,'EM0004','CS00001'),
  (74,11,3001,20,1,'EM0004','CS00001'),
  (75,11,3005,20,1,'EM0005','CS00001'),
  (76,12,1009,50,1,'EM0006','CS00001'),
  (77,12,1006,40,1,'EM0006','CS00001'),
  (78,12,2005,35,1,'EM0004','CS00001'),
  (79,12,2001,15,1,'EM0004','CS00001'),
  (80,12,NULL,NULL,0,NULL,NULL),
  (81,12,3004,20,1,'EM0004','CS00001'),
  (82,13,1002,60,1,'EM0004','CS00007'),
  (83,13,1004,70,1,'EM0004','CS00007'),
  (84,13,1009,50,1,'EM0004','CS00007'),
  (85,13,2001,15,1,'EM0005','CS00007'),
  (86,13,2003,20,1,'EM0005','CS00007'),
  (87,13,2004,20,1,'EM0006','CS00007'),
  (88,13,3003,20,1,'EM0004','CS00007'),
  (89,13,3002,20,1,'EM0006','CS00007'),
  (90,13,3002,20,1,'EM0006','CS00007'),
  (91,14,1004,70,1,'EM0005',NULL),
  (92,14,1007,40,1,'EM0004',NULL),
  (93,14,2002,20,1,'EM0006',NULL),
  (94,14,2004,20,1,'EM0006',NULL),
  (95,14,3005,20,1,'EM0005',NULL),
  (96,14,3003,20,1,'EM0006',NULL),
  (97,15,1003,50,1,'EM0006','CS00021'),
  (98,15,2005,35,1,'EM0005','CS00021'),
  (99,15,3001,20,1,'EM0005','CS00021'),
  (100,16,1004,70,1,'EM0006','CS00017'),
  (101,16,1006,40,1,'EM0006','CS00017'),
  (102,16,2005,35,1,'EM0006','CS00017'),
  (103,16,2003,20,1,'EM0004','CS00017'),
  (104,16,3003,20,1,'EM0004','CS00017'),
  (105,16,3003,20,1,'EM0004','CS00017'),
  (106,17,1004,70,1,'EM0004','CS00026'),
  (107,17,1007,40,1,'EM0005','CS00026'),
  (108,17,2004,20,1,'EM0005','CS00026'),
  (109,17,2003,20,1,'EM0004','CS00026'),
  (110,17,NULL,NULL,0,NULL,NULL),
  (111,17,NULL,NULL,0,NULL,NULL),
  (112,18,1004,70,1,'EM0005','CS00005'),
  (113,18,2004,20,1,'EM0004','CS00005'),
  (114,18,3003,20,1,'EM0005','CS00005'),
  (115,19,1002,60,1,'EM0006','CS00003'),
  (116,19,2004,20,1,'EM0004','CS00003'),
  (117,19,3005,20,1,'EM0004','CS00003'),
  (118,20,1001,50,1,'EM0005','CS00001'),
  (119,20,1006,40,1,'EM0006','CS00001'),
  (120,20,2002,20,1,'EM0006','CS00001'),
  (121,20,2003,20,1,'EM0004','CS00001'),
  (122,20,NULL,NULL,0,NULL,NULL),
  (123,20,3004,20,1,'EM0005','CS00001'),
  (124,21,1004,70,1,'EM0006','CS00013'),
  (125,21,2003,20,1,'EM0005','CS00013'),
  (126,21,NULL,NULL,0,NULL,NULL),
  (127,22,1009,50,1,'EM0004','CS00019'),
  (128,22,2005,35,1,'EM0006','CS00019'),
  (129,22,3001,20,1,'EM0005','CS00019'),
  (130,23,1005,40,1,'EM0004','CS00008'),
  (131,23,1005,40,1,'EM0006','CS00008'),
  (132,23,1009,50,1,'EM0006','CS00008'),
  (133,23,2005,35,1,'EM0006','CS00008'),
  (134,23,2003,20,1,'EM0004','CS00008'),
  (135,23,2003,20,1,'EM0004','CS00008'),
  (136,23,3002,20,1,'EM0006','CS00008'),
  (137,23,3004,20,1,'EM0004','CS00008'),
  (138,23,3003,20,1,'EM0004','CS00008'),
  (139,24,1001,50,1,'EM0006','CS00021'),
  (140,24,1008,60,1,'EM0006','CS00021'),
  (141,24,1009,50,1,'EM0006','CS00021'),
  (142,24,2003,20,1,'EM0006','CS00021'),
  (143,24,2005,35,1,'EM0006','CS00021'),
  (144,24,2001,15,1,'EM0005','CS00021'),
  (145,24,3002,20,1,'EM0006','CS00021'),
  (146,24,3002,20,1,'EM0006','CS00021'),
  (147,24,3004,20,1,'EM0005','CS00021'),
  (148,25,1009,50,1,'EM0006','CS00026'),
  (149,25,2002,20,1,'EM0006','CS00026'),
  (150,25,3002,20,1,'EM0004','CS00026');

--CREATE TABLE invoices
CREATE TABLE invoices (
  invoice_id INT NOT NULL PRIMARY KEY,
  invoice_date DATE,
  customer_id VARCHAR NULL,
  total NUMERIC,
  employee_id VARCHAR NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO invoices VALUES
  (1,'2022-11-03',NULL,190,'EM0003'),
  (2,'2022-11-03','CS00009',85,'EM0002'),
  (3,'2022-11-04','CS00023',185,'EM0002'),
  (4,'2022-11-05','CS00006',275,'EM0003'),
  (5,'2022-11-05','CS00013',250,'EM0002'),
  (6,'2022-11-09','CS00007',280,'EM0003'),
  (7,'2022-11-10','CS00010',300,'EM0003'),
  (8,'2022-11-11','CS00014',110,'EM0003'),
  (9,'2022-11-11',NULL,240,'EM0001'),
  (10,'2022-11-13','CS00020',190,'EM0003'),
  (11,'2022-11-14','CS00001',205,'EM0003'),
  (12,'2022-11-16','CS00001',160,'EM0003'),
  (13,'2022-11-16','CS00007',295,'EM0003'),
  (14,'2022-11-17',NULL,190,'EM0002'),
  (15,'2022-11-21','CS00021',105,'EM0002'),
  (16,'2022-11-21','CS00017',205,'EM0001'),
  (17,'2022-11-22','CS00026',150,'EM0002'),
  (18,'2022-11-23','CS00005',110,'EM0002'),
  (19,'2022-11-23','CS00003',100,'EM0001'),
  (20,'2022-11-23','CS00001',150,'EM0002'),
  (21,'2022-11-23','CS00013',90,'EM0001'),
  (22,'2022-11-23','CS00019',105,'EM0003'),
  (23,'2022-11-24','CS00008',265,'EM0002'),
  (24,'2022-11-24','CS00021',290,'EM0001'),
  (25,'2022-11-25','CS00026',90,'EM0002');
--Query1 Find the top selling part-time employees. 
.mode column
.header on
SELECT 
	i.employee_id,
 	e.firstname ||' '|| e.lastname AS Employee_name,
 	SUM(i.total) AS amount
FROM invoices AS i
JOIN employees AS e
	ON i.employee_id = e.employee_id
GROUP by i.employee_id
ORDER BY SUM(i.total) DESC;

--Query2 Find sales by customer region.
.mode column
.header on
SELECT
	c.region,
    COUNT(i.invoice_id) AS total_invoices,
	SUM(i.total) AS amount
FROM invoices AS i
JOIN customers AS c
	ON i.customer_id = c.customer_id
GROUP BY c.region
ORDER BY SUM(i.total) DESC;

--Query3 Find popular menus by type of food, drinks and desserts.
.mode column
.header on
SELECT
	sub.menu_id,
  	menu.menu_name,
	sub.menu_type,
	max(sub.aa) AS unit,
    sub.total
FROM (
  SELECT	
  	menu_id,
    quantity,
    CASE   -- separete menu_id to type of food
    	WHEN menu_id LIKE '1%' THEN 'FOOD'
        WHEN menu_id LIKE '2%' THEN 'DRINK'
        ELSE 'DESSERT'
    END AS menu_type,
  	COUNT(menu_id) AS aa,
    SUM(menu_price) AS total
  FROM orders
  GROUP by menu_id
  ORDER BY total DESC
) AS sub
JOIN menu ON sub.menu_id = menu.menu_id
GROUP by sub.menu_type
ORDER BY sub.menu_id;
