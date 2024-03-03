-- Create the tables

CREATE TABLE Client (
 client_Id     int PRIMARY Key,
 client_Fname  varchar(35) not null,
 client_Lname  varchar(35) not null,
 client_phone  char(10) not null,
 client_Rating int
);
CREATE TABLE Service (
  service_Id            int PRIMARY KEY,
  service_Name          varchar(35) not null,
  service_Category      char (10),
  service_Price         decimal(5, 2)
 
);

CREATE TABLE Appointement (
  appointement_Number   int PRIMARY KEY,
  appointement_Date     Date NOT NULL,
  appointement_Duration decimal(2, 2),
  client_Id             int NOT NULL,
  service_Id            int NOT NULL,
 CONSTRAINT has FOREIGN KEY (client_Id) REFERENCES Client(client_Id) 
                ON UPDATE CASCADE ON DELETE SET NULL,
 CONSTRAINT have FOREIGN KEY (service_Id) REFERENCES Service(service_Id) 
                ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Client_Bill (
  clientBill_Number         int PRIMARY KEY,
  clientBill_Date           Date NOT NULL,
  clientBill_DutyFree_Total decimal(8, 2),
  clientBill_VAT            decimal(2, 2),
  clientBill_Total          decimal(8, 2),
  client_Id                 int NOT NULL,
  appointement_Number       int NOT NULL,
 CONSTRAINT clB FOREIGN KEY  (client_Id) REFERENCES Client(client_Id) 
                ON UPDATE CASCADE ON DELETE SET NULL,
 CONSTRAINT clS FOREIGN KEY  (appointement_Number ) REFERENCES appointement (appointement_Number )
                ON UPDATE CASCADE ON DELETE SET NULL
);



CREATE TABLE Ordert (
  order_Number          int PRIMARY KEY,
  order_Date            Date not null,
  order_Comments        varchar (50),
  order_Delivery_Date   date not null,
  order_Status          varchar (15)

);

CREATE TABLE Provider (
  provider_ID           int PRIMARY KEY,
  provider_Lname        varchar(35) not null, 
  provider_Fname        varchar(35) not null,
  provider_Phone        char(10) not null,
  provider_Address      varchar (30) 
 
);

CREATE TABLE Product (
  product_Code          Varchar(10) PRIMARY KEY,
  product_Name          varchar(35) not null,
  product_Brand         varchar(20),
  product_Category      char(10),
  provider_ID           int NOT NULL,
 CONSTRAINT orders FOREIGN KEY (provider_ID) REFERENCES Provider(provider_ID) 
                ON UPDATE CASCADE ON DELETE SET NULL
 
);



CREATE TABLE Provider_Bill (
  bill_Number           int PRIMARY KEY,
  bill_Date             Date, 
  bill_Total            decimal(5, 2) not null,
  provider_ID           int not null,
 CONSTRAINT gives FOREIGN KEY (provider_ID) REFERENCES Provider(provider_ID)
                 ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Line (
  product_Code    Varchar(10) PRIMARY KEY, 
  order_Number    int Not Null,
  quantity        int not null,
 CONSTRAINT proL  FOREIGN KEY (product_Code) REFERENCES Product(product_Code) 
                ON UPDATE CASCADE, 
 CONSTRAINT OL  FOREIGN KEY (order_Number) REFERENCES Ordert(order_Number) 
                ON UPDATE CASCADE
);

CREATE TABLE Bilan (
  bilan_Number          int PRIMARY KEY,
  bilan_Date            date not null,
  bilan_Total_Revenue   decimal(10, 2),
  bilan_Total_Expenses  decimal(10, 2),
  bilan_Profits         decimal(10, 2)
 
);

CREATE TABLE Selection (
  service_Id            int PRIMARY KEY,
  appointement_Number   int NOT NULL, 
  service_Duration      decimal(2, 2),
 CONSTRAINT SI  FOREIGN KEY (service_Id) REFERENCES Service(service_Id) 
                ON UPDATE CASCADE,
 CONSTRAINT AN  FOREIGN KEY (appointement_Number) REFERENCES appointement (appointement_Number) 
                ON UPDATE CASCADE 
);

CREATE TABLE Employee (
  employee_ID           int PRIMARY KEY,
  employee_Lname        varchar(15),
  employee_Fname        varchar(15),
  employee_Salary       decimal(8,2),
  employee_Phone        char(10),
  employee_Position     char(8),
  employee_BOB          Date
 
);


CREATE TABLE Manager (
employee_ID int not null,
Hours_wrkd  decimal (2,2),

CONSTRAINT You  FOREIGN KEY (employee_ID) REFERENCES Employee (employee_ID) 
                
)INHERITS (Employee);


CREATE TABLE service_Provider (
employee_ID int not null,
Hours_Recorded decimal (3,2),

CONSTRAINT oo  FOREIGN KEY (employee_ID) REFERENCES Employee (employee_ID) 
                
)INHERITS (Employee);

-- Populate tables

INSERT INTO Client (client_Id, client_Fname, client_Lname , client_phone, client_Rating) VALUES

 (111, 'Safae',        'Bencharki' ,'0615768745',   5),
 (112, 'Jinane',       'Goulla' ,   '0674359801',   5),
 (113, 'Moussa',       'Afifi',     '0675349801',   5),
 (114, 'Khadija',      'Sadik',     '0614907156',   3),
 (115, 'Fatiha',       'Bennani',   '0678905412',   3),
 (116, 'Sabrine',      'Salhi',     '0651781985',   3),
 (117, 'Yousra',       'Jaidi',     '0615890765',   3),
 (118, 'Mehdi',        'Miri',      '0651809818',   3),
 (119, 'Chahinaz',     'Hajjaj',    '0675490941',   5),
 (120, 'Laila',        'Yahiyaoui', '0698734596',   5),
 (121, 'Fadwa',        'kartal',    '0651896543',   3),
 (122, 'Abderrahmane', 'Yabani',    '0651425376',   3),
 (123, 'Zineb',        'Berrada',   '0613567809',   3),
 (124, 'Shahra',       'Iraki',     '0661279500',   3),
 (125, 'Rabiaa',       'Khalfi',    '0721135022',   3);

INSERT INTO Service (service_Id, service_Name, service_Category, service_Price) VALUES 

(302, 'Skin Care',     'beauty', 300.00),
(303, 'Hair Brushing', 'beauty', 50.00 ),
(305, 'Hair Care',     'beauty', 700.00),
(306, 'Nail Polishing','beauty', 30.00 );

 INSERT INTO Appointement (appointement_Number, appointement_Date, appointement_Duration, client_Id, service_Id) VALUES

 (1090, '12-01-2019',        00.60,     120,   302),
 (1091, '03-11-2019',        00.15,     119,   303),
 (1094, '11-29-2019',        00.35,     124,   303),
 (1093, '09-19-2019',        00.45,     117,   302),
 (1095, '10-04-2019',        00.10,     122,   305),
 (1097, '02-02-2019',        00.55,     117,   305),
 (1096, '09-02-2019',        00.17,     117,   302),
 (1098, '01-28-2019',        00.20,     116,   303),
 (1099, '06-25-2019',        00.25,     116,   302),
 (1100, '01-01-2019',        00.60,     111,   305),
 (1101, '03-09-2019',        00.23,     112,   302),
 (1102, '08-08-2019',        00.35,     119,   303),
 (1113, '09-10-2019',        00.90,     115,   302),
 (1104, '06-06-2019',        00.54,     114,   302);

INSERT INTO Client_Bill (clientBill_Number, clientBill_Date, clientBill_DutyFree_Total, clientBill_VAT, clientBill_Total, client_Id, appointement_Number) VALUES

(514, '01-01-2020', 105.00, 0.20, 107.00,  120,  1090),
(515, '07-09-2019', 222.70, 0.50, 225.20,  112,  1101),
(516, '09-03-2019', 50.00 , 0.00, 51.00 ,  122,  1095),
(517, '03-12-2017', 75.00 , 0.70, 77.70 ,  117,  1097),
(519, '09-06-2020', 50.00 , 0.50, 453.50,  119,  1096),
(520, '07-05-2019', 700.00, 0.00, 704.00,  114,  1104),
(521, '07-12-2017', 60.00 , 0.50, 61.50 ,  119,  1091),
(522, '03-12-2020', 190.00, 0.80, 192.80,  117,  1096),
(523, '09-06-2019', 30.00 , 0.00, 31.00 ,  116,  1099);


INSERT INTO Ordert (order_Number, order_Date, order_Comments, order_Delivery_Date, order_Status) VALUES

 (2090, '04-01-2019',        'no comment',   '01-05-2019',  'validated'),
 (2091, '11-04-2019',        'no comment',   '11-07-2019',  'validated'),
 (2092, '01-07-2019',        'no comment',   '01-09-2019',  'validated'),
 (2094, '09-11-2019',        'no comment',   '09-12-2019',  'validated'),
 (2093, '09-09-2019',        'no comment',   '09-11-2019',  'validated'),
 (2095, '04-11-2019',        'no comment',   '10-11-2019',  'validated'),
 (2097, '06-04-2019',        'no comment',   '08-04-2019',  'validated'),
 (2096, '09-03-2019',        'no comment',   '10-03-2019',  'validated'),
 (2098, '08-02-2019',        'no comment',   '10-02-2019',  'validated'),
 (2099, '05-07-2019',        'no comment',   '06-07-2019',  'validated'),
 (2100, '01-02-2019',        'no comment',   '02-02-2019',  'validated'),
 (2101, '03-10-2019',        'no comment',   '03-11-2019',  'validated'),
 (2102, '08-09-2019',        'no comment',   '10-09-2019',  'validated'),
 (2113, '09-11-2019',        'no comment',   '09-19-2019',  'validated'),
 (2104, '09-07-2019',        'no comment',   '09-14-2019',  'validated');

 INSERT INTO Provider (provider_ID, provider_Lname, provider_Fname, provider_Phone, provider_Address) VALUES 

 (21225, 'SaadAllah', 'Aziz',   '0631568943', '13 Lots Limoun'             ),
 (21226, 'ElFadili',  'Hanane', '0713568409', '40 Avenue El Ouafae'        ),
 (21231, 'Elfed',     'Hassan', '0765345412', '67 avenue Mimouza'          ),
 (21344, 'Assad',     'Khadija','0654678902', '18 Lots AL amal'            ),
 (22567, 'Baz',       'Ahmed',  '0613684906', '65 LOTS Zitoun'             ),
 (23119, 'Esadik',    'Said',   '0650908123', '17 avunue Ahl Fes'          ),
 (24004, 'Bennani',   'Qais',   '0076541908', '7 LOTS Hamza'               ),
 (24288, 'Akkaboun',  'Ghali',  '0645312689', '5 LOTS jnane Fes'           ),
 (25443, 'Idrissi',   'Saif',   '0678980312', '19 Avenue Mohammed 5'       ),
 (25501, 'Mahfoud',   'Alae',   '0786543123', '12 LOts Prestigia '         ),
 (25595, 'Kettani',   'Wissam', '0678954134', '1 Avenue Allal Ben Abdallah');


 INSERT INTO Product (product_Code, product_Name, product_Brand, product_Category, provider_ID) VALUES 

 ('11QER/31', 'Hair dryer'    ,  'Dyson',         'Beauty',  21225 ),
 ('13-Q2/P2', 'brush'         ,  'Hairy',         'Beauty',  21225 ),
 ('14-Q1/L3', 'nail polish'   ,  'OPI',           'Beauty',  24288 ),
 ('1546-QQ2', 'hair vitamins' ,  'HairVitamins',  'Beauty',  23119 ),
 ('1558-QW1', 'Mirror'        ,  'Ikea',          'Beauty',  22567 ),
 ('2232/QTY', 'BShampoo'      ,  'Loreal',        'Beauty',  24004 ),
 ('2232/QWE', 'Conditioner'   ,  'Loreal',        'Beauty',  23119 ),
 ('2238/QPD', 'Moisturizer'   ,  'Loreal',        'Beauty',  24288 );



 INSERT INTO Provider_Bill (bill_Number , bill_Date, bill_Total, provider_ID) VALUES 

 (21225, '07-09-2019',   798.02,  24004 ),
 (21226, '05-06-2020',   100.90,  23119 ),
 (21231, '07-05-2019',   256.00,  21225 ),
 (21344, '03-04-2019',   109.00,  22567 ),
 (22567, '03-03-2019',   987.00,  25595 ),
 (23119, '03-12-2020',   540.90,  22567 ),
 (24004, '10-11-2017',   210.00,  23119 ),
 (24288, '09-09-2019',   670.00,  22567 ),
 (25443, '08-08-2018',   290.00,  24004 ),
 (25501, '03-12-2017',   786.00,  23119 ),
 (25595, '11-12-2020',   360.03,  24004 );

 INSERT INTO Line (product_Code, order_Number, quantity) VALUES 

 ('11QER/31',  2090,  14),
 ('13-Q2/P2',  2113,   9),
 ('14-Q1/L3',  2100,   4),
 ('1546-QQ2',  2100,  38),
 ('1558-QW1',  2100,  39),
 ('2232/QTY',  2098,  14),
 ('2232/QWE',  2113,   4),
 ('2238/QPD',  2098,   9);
 
 

INSERT INTO Bilan (bilan_Number, bilan_Date, bilan_Total_Revenue, bilan_Total_Expenses, bilan_Profits) VALUES 

(12, '06-12-2020', 5400.00, 350.00 , 5050.00),
(13, '03-12-2017', 7600.00, 1000.00, 6600.00),
(14, '08-08-2018', 2999.00, 698.00 , 2301.00),
(16, '03-03-2019', 7800.00, 209.00 , 7591.00),
(17, '07-05-2019', 2789.00, 90.00  , 2699.00),
(18, '07-09-2019', 3289.00, 129.00 , 3160.00),
(19, '03-12-2020', 3246.00, 210.00 , 3036.00),
(20, '03-11-2017', 9899.00, 345.00 , 9545.00),
(21, '05-06-2020', 6781.00, 215.00 , 6566.00),
(22, '09-06-2020', 2415.00, 500.00 , 1915.00);




INSERT INTO Selection (service_Id, appointement_Number, service_Duration ) VALUES

(302, 1093, 00.30),
(303, 1096, 00.60),
(305, 1101, 00.45),
(306, 1094, 00.35);

INSERT INTO Employee (employee_ID, employee_Lname, employee_Fname, employee_Salary, employee_Phone, employee_Position, employee_BOB ) VALUES

(76, 'Idrissi', 'Salma',  4500, '0651787435', 'S', '04-07-1996'),
(77, 'Knizi',   'Fadoua', 4500, '0631568613', 'S',  '09-03-1996'),
(78, 'Ahmadi',  'Wissal', 4500, '0613459851', 'S',  '09-12-1997'),
(79, 'Rahimi', 'Souad',   7000, '0785147809', 'M',  '07-11-1992');

INSERT INTO service_Provider (employee_ID, Hours_Recorded) VALUES 

(76, 00.50),
(77, 00.60),
(78, 00.30);

INSERT INTO  Manager (employee_ID, Hours_wrkd) VALUES 
(79, 00.50);

---------------------------------------Adding new values to some tables---------------------------------------------------------------------
INSERT INTO Client (client_Id, client_Fname, client_Lname client_phone, client_Rating) VALUES
(126, 'Ahmed', 'Lkhnichi', '0611398745', 3),
(127, 'ayoub', 'chalhoub', '0674309871', 4);

INSERT INTO Appointement (appointement_Number, appointement_Date, appointement_Duration, client_Id, service_Id) VALUES

 (1105, '02-05-2019',        00.60,     120,   302),
 (1106, '12-11-2020',        00.34,     119,   303);

 INSERT INTO Provider (provider_ID, provider_Lname, provider_Fname, provider_Phone, provider_Address) VALUES 

 (25596, 'Ahmadi',    'Asaad',    '0631568943', '13 Lots Jnane fes'      ),
 (21226, 'ElFanidi',  'Mohammed', '0714780951', '40 Avenue Ghandi'       );

 ----------------------------------------Deleting from a table-------------------------------------------------------------------------------

 DELETE FROM Provider

 WHERE provider_ID = 25596;

 -----------------------------------------Updating------------------------------------------------------------------------------------------

 UPDATE Product SET product_Name = 'keratin'
 WHERE product_Code = '1546-QQ2';

 
 -----------------------------------------Searching------------------------------------------------------------------------------------------

 SELECT * FROM Ordert
 WHERE order_Number = '2091' AND order_Comments = 'no comment';

 SELECT * FROM Client 
 WHERE Client_Fname = 'Moussa' AND client_phone = '0675349801';

 -----------------------------------------Using Joins---------------------------------------------------------------------------------------
SELECT C.client_Lname, C.client_Fname, CB.clientBill_Total
FROM Client AS C JOIN Client_Bill AS CB 
    ON C.client_Id = CB.client_Id
    WHERE CB.clientBill_Total > 100;

SELECT O.order_Number, L.quantity
FROM Ordert AS O JOIN Line AS L
    ON O.order_Number = L.order_Number
    WHERE O.order_Status > 'Validated';

-----------------------------------------Using GROUP BY----------------------------------------------------------------------------------

SELECT client_Id, client_Fname, client_Lname
FROM Client
GROUP BY client_Id
HAVING Client_Rating ‹= (SELECT avg (Client_Rating) FROM Client);

-------------------------------A stored procedure counting the number of client bills issued between two dates----------------------------

CREATE PROCEDURE checkdate (d1 date, d2 date)
Language plpgsql
AS $$
DECLARE cnt int;
BEGIN
    SELECT COUNT (*) INTO cnt
    FROM Client_Bill
    WHERE clientBill_Date BETWEEN d1 and d2;

RAISE NOTICE 'The number of dates between % and % is: %', d1, d2, cnt;

END;
$$;

CALL checkdate ('03-12-2017', '03-12-2020');

-------------------------------------Function counting number of clients having a certain Rating----------------------------------------

CREATE FUNCTION numberofclientt (clientRating int)
RETURNS int
LANGUAGE plpgsql
AS $$
BEGIN 
    RETURN (SELECT COUNT (*)
            FROM Client
            where client_Rating = clientRating);
END;
$$

SELECT numberofclientt (5) AS "number of clients";

-------------------------------------Trigger checking the name of the category before inserting-------------------------------------

CREATE FUNCTION checkCat ()
RETURNS TRIGGER
AS $$
BEGIN
UPDATE Service
SET reorder = 1

    WHERE service_Category;
    RETURN NEW; END; $$

LANGUAGE plpgsqL;

CREATE TRIGGER servichCategory BEFORE INSERT ON
Service FOR FACH ROW

WHEN (NEW.service_Category = 'Beauty')

EXECUTE FUNCTION checkCat();