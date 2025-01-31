/* Created with, and works 100% on, MS SQL SMS */

INSERT INTO Client VALUES (100, 'Matthew', 'Flojo', 6045551234, '123 2nd Ave', 'Student');
INSERT INTO Client VALUES (101, 'John', 'Connor', 6045129876, '#159-8746 Crescent St.', 'Nurse');
INSERT INTO Client VALUES (102, 'Sally', 'Sallows', 6043004000, '6512 Victoria Dr.', 'Accountant');
INSERT INTO Client VALUES (103, 'Mizu', 'Katoki', NULL, '7111 152nd St.', NULL);
INSERT INTO Client VALUES (104, 'Gerald', 'Fuller', NULL, '#41-1235 71 Ave.', NULL);
INSERT INTO Client VALUES (105, 'Farmer', 'Joe', 6041234567, '832 Lawrence St.', 'Farmer');
INSERT INTO Client VALUES (106, 'Gloria', 'Hefo', 6045718131, '8990 Howe St.', 'Construction Manager');
INSERT INTO Client VALUES (107, 'Tester', 'Human', NULL, 'Possibly a robot st.', NULL);
INSERT INTO Client VALUES (108, 'Chat', 'Gpt', NULL, 'Possibly a robot st.', NULL);

INSERT INTO Client_Dependants VALUES (102, 'Johnny', 'Sallows', 2013004000);
INSERT INTO Client_Dependants VALUES (101, 'Greg', 'Connor', NULL);

INSERT INTO Buyer VALUES (100);
INSERT INTO Buyer VALUES (101);
INSERT INTO Buyer VALUES (104);
INSERT INTO Buyer VALUES (105);

INSERT INTO Seller VALUES (100);
INSERT INTO Seller VALUES (104);
INSERT INTO Seller VALUES (106);

INSERT INTO Renter VALUES (102, 'ARW923');
INSERT INTO Renter VALUES (103, 'IKJ128');

INSERT INTO Property VALUES (200, '2-Bed, 2-Bath Condo', '5797 128 St.', 588000.00, '2023-01-15', 100);
INSERT INTO Property VALUES (201, '5-Bed, 2-Bath House', '451 Moon St.', 680000.00, '2022-04-28', 104);
INSERT INTO Property VALUES (202, '2 acre corn farm', '5611 Wallaby Dr.', 150000.00, '2022-04-28', 106);
INSERT INTO Property VALUES (203, '1500Sq foot Open Land Lot', '333 Vancouver Dr', 350000.00, '2020-01-01', 106);
INSERT INTO Property VALUES (204, '600Car Parking Garage', '7326 56ave Surrey', 200900.50, '2022-12-04', 106);
INSERT INTO Property VALUES (205, 'Surrey Rec Centre.', '12041 152nd St.', 980000.00, '2023-02-28', 100);

INSERT INTO PropertyPhotos VALUES (200, 'www.condophoto.com/1.jpg');
INSERT INTO PropertyPhotos VALUES (200, 'www.condophoto.com/2.jpg');
INSERT INTO PropertyPhotos VALUES (202, 'www.housephoto.com/13.jpg');
INSERT INTO PropertyPhotos VALUES (202, 'www.housephoto.com/14.jpg');
INSERT INTO PropertyPhotos VALUES (202, 'www.housephoto.com/15.jpg');

INSERT INTO Condo VALUES (200, 599.73);
INSERT INTO Land VALUES (203, 800.90);
INSERT INTO Parking VALUES (204, 1299.99);
INSERT INTO Agriculture VALUES (202, 800.00);
INSERT INTO Recreational VALUES (205, 3680.00);
INSERT INTO DetatchedHouse VALUES (201, 650.99, 350.50);

INSERT INTO RealtyCompany VALUES ('REMAX', 6048713280, '#41-4123 Bixby Road');
INSERT INTO RealtyCompany VALUES ('Sutton', 6043509999, '9001 Howe St.');
INSERT INTO RealtyCompany VALUES ('Home Realty Co.', 6041112222, '15208 40 St.');
INSERT INTO RealtyCompany VALUES ('Umbrella Inc.', 6049879876, '321 Umbrella Ave.');

INSERT INTO Agent VALUES (300, 'Aj', 'Cooper', 'ajcooper@remax.com', 7789018888, NULL, 8, 'REMAX');
INSERT INTO Agent VALUES (301, 'Kristina', 'Abern', 'kabern@remax.com', 7785431777, NULL, NULL, 'REMAX');
INSERT INTO Agent VALUES (302, 'Max', 'Juker', 'mjuker@sutton.com', 7781265123, '123 Howe St.', 2, 'Sutton');
INSERT INTO Agent VALUES (303, 'Buddy', 'Holly', 'bholly@homerealty.com', 7787654321, NULL, NULL, 'Home Realty Co.');

INSERT INTO Bank VALUES ('BMO', '56 BMO Dr.');
INSERT INTO Bank VALUES ('Royal Bank', '567 Royal Ave.');
INSERT INTO Bank VALUES ('Coastal Credit', '142 Coastal Road');
INSERT INTO Bank VALUES ('Bank Of Canada', '5555 Canada St.');
INSERT INTO Bank VALUES ('Capitol Credit Union', '23 Capitol st');

INSERT INTO BuySellContract VALUES (400, '2022-07-22', 580000.00, 100, 106, 300, 200);
INSERT INTO BuySellContract VALUES (401, '2023-01-07', 150000.00, 105, 106, 300, 202);
INSERT INTO BuySellContract VALUES (402, '2018-02-02', 200900.00, 104, 100, 301, 204);

INSERT INTO RentalContract VALUES (500, 3800.00, 'Tenant: Sally Sallows', '2019-01-15', NULL, 102, 301, 201);

INSERT INTO Bank_Mortgages_BuySellContract VALUES ('BMO', 400, 100000.00);
INSERT INTO Bank_Mortgages_BuySellContract VALUES ('Royal bank', 400, 75000.00);
INSERT INTO Bank_Mortgages_BuySellContract VALUES ('BMO', 401, 28000.00);
INSERT INTO Bank_Mortgages_BuySellContract VALUES ('Coastal Credit', 402, 28000.00);