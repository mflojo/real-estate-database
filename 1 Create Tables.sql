/* Created with, and works 100% on, MS SQL SMS */

/* The Table name "Client" is not usable in MySQL, only in MS SQL */

CREATE TABLE Client (
	ClientID INT,		/* starts at 100 */
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	PhoneNum VARCHAR(10),
	Address VARCHAR(100) NOT NULL,
	Occupation VARCHAR(20),
	PRIMARY KEY (ClientID)
);

CREATE TABLE Client_Dependants (
	ClientID INT,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	PhoneNum VARCHAR(10),
	PRIMARY KEY (ClientID, FirstName, LastName),
	FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON DELETE CASCADE
);

CREATE TABLE Buyer (
	ClientID INT,
	PRIMARY KEY (ClientID),
	FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON DELETE CASCADE
);

CREATE TABLE Seller (
	ClientID INT,
	PRIMARY KEY (ClientID),
	FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON DELETE CASCADE
);

CREATE TABLE Renter (
	ClientID INT,
	RentalLicense VARCHAR(30) NOT NULL,
	PRIMARY KEY (ClientID),
	FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON DELETE CASCADE
);

CREATE TABLE Property (
	PropertyID INT,		/* starts at 200 */
	Description VARCHAR(50),
	Address VARCHAR(100) NOT NULL,
	Price NUMERIC(11,2) NOT NULL,
	ListedSince DATE NOT NULL,
	OwnerClientID INT,
	PRIMARY KEY (PropertyID),
	FOREIGN KEY (OwnerClientID) REFERENCES Client(ClientID) ON DELETE CASCADE
);

CREATE TABLE PropertyPhotos (
	PropertyID INT,
	Photos VARCHAR(40),
	PRIMARY KEY (PropertyID, Photos),
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE Condo (
	PropertyID INT,
	StrataFee NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (PropertyID),
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE Land (
	PropertyID INT,
	InsuranceFee NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (PropertyID),
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE Parking (
	PropertyID INT,
	ParkingTaxRate NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (PropertyID),
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE Agriculture (
	PropertyID INT,
	FarmLandFee NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (PropertyID),
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE Recreational (
	PropertyID INT,
	RecPropertyFee NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (PropertyID),
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE DetatchedHouse (
	PropertyID INT,
	PropertyTax NUMERIC(6,2) NOT NULL,
	UtilityFee NUMERIC(6,2) NOT NULL,
	PRIMARY KEY (PropertyID),
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE RealtyCompany (
	RealtyCompanyName VARCHAR(25),
	PhoneNum VARCHAR(10) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	PRIMARY KEY (RealtyCompanyName)
);

CREATE TABLE Agent (
	AgentLicenseNum INT,		/* starts at 300 */
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	PhoneNum VARCHAR(10) NOT NULL,
	Address VARCHAR(50),
	YearsOfExp INT,
	RealtyCompanyName VARCHAR(25),
	PRIMARY KEY (AgentLicenseNum),
	FOREIGN KEY (RealtyCompanyName) REFERENCES RealtyCompany(RealtyCompanyName) ON DELETE CASCADE
);

CREATE TABLE Bank (
	BankName VARCHAR(30),
	Address VARCHAR(30) NOT NULL,
	PRIMARY KEY (BankName)
);

CREATE TABLE BuySellContract (
	BuySellContractID INT,		/* starts at 400 */
	SignDate DATE NOT NULL,
	PurchaseAmount NUMERIC(11,2) NOT NULL,
	BuyerClientID INT,
	SellerClientID INT,
	AgentLicenseNum INT,
	PropertyID INT,
	PRIMARY KEY (BuySellContractID),
	FOREIGN KEY (BuyerClientID) REFERENCES Buyer(ClientID) ON DELETE NO ACTION,
	FOREIGN KEY (SellerClientID) REFERENCES Seller(ClientID) ON DELETE NO ACTION,
	FOREIGN KEY (AgentLicenseNum) REFERENCES Agent(AgentLicenseNum) ON DELETE CASCADE,
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE RentalContract (
	RentContractID INT,			/* starts at 500 */
	RentAmount NUMERIC(7,2) NOT NULL,
	TenantInfo VARCHAR(50) NOT NULL,
	RentStartDate DATE NOT NULL,
	RentEndDate DATE,
	RenterClientID INT,
	AgentLicenseNum INT,
	PropertyID INT,
	PRIMARY KEY (RentContractID),
	FOREIGN KEY (RenterClientID) REFERENCES Renter(ClientID) ON DELETE NO ACTION,
	FOREIGN KEY (AgentLicenseNum) REFERENCES Agent(AgentLicenseNum) ON DELETE CASCADE,
	FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE
);

CREATE TABLE Bank_Mortgages_BuySellContract (
	BankName VARCHAR(30),
	BuySellContractID INT,
	MortgageAmount NUMERIC(8,2) NOT NULL,
	PRIMARY KEY (BankName, BuySellContractID),
	FOREIGN KEY (BankName) REFERENCES Bank(BankName) ON DELETE CASCADE,
	FOREIGN KEY (BuySellContractID) REFERENCES BuySellContract(BuySellContractID) ON DELETE CASCADE
);