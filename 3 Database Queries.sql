/*	Display BankName, Address, and MortgageAmount from banks who don't have any mortgages on record */
SELECT B.BankName, B.Address, BM.MortgageAmount
FROM Bank B LEFT JOIN Bank_Mortgages_BuySellContract BM ON B.BankName = BM.BankName
WHERE BM.MortgageAmount IS NULL;

/*	Agent Aj Cooper got a new phone number and moved to a new apartment for his 9th year as an Agent, Update his info
	(needs and agent with the first name Aj in schema) */
UPDATE Agent
SET PhoneNum = 6041234567, Address = '123 New Apt Dr.', YearsOfExp = 9
WHERE FirstName = 'Aj' AND LastName = 'Cooper';

/*	Set a placeholder phone number for any agent that has no number entered */
UPDATE Agent
SET PhoneNum = 1234567
WHERE PhoneNum IS NULL;

/*	We need to remove a photo that ends in 15.jpg due to privacy issues 
	(needs a photo with a 15, eg: "photo15.jpg" in the schema) */
DELETE FROM PropertyPhotos
WHERE Photos LIKE '%15%';

/*	Delete all clients from the database without a phone number */
DELETE FROM Client
WHERE PhoneNum IS NULL;

/*	Get ClientID, Name, Occupation, Description, Price Where the Price of the property is higher than the average of all properties */ 
SELECT C.ClientID, C.FirstName, C.LastName, C.Occupation, P.Description, P.Price
FROM Client C, Property P
WHERE Price > (SELECT AVG(Price) FROM Property WHERE C.ClientID = P.OwnerClientID);

/*	Select firstname, lastname and num from both Clients and Agents that have interacted with the BuySell contract*/
SELECT C.FirstName AS [Client FName], C.LastName AS [Client LName], C.PhoneNum AS [Client Num], A.FirstName AS [Agent Fname], A.LastName AS [Agent Lname], A.PhoneNum AS [Agent Num]
FROM Agent A FULL JOIN (Client C FULL JOIN BuySellContract BSC ON C.ClientID = BSC.BuyerClientID) ON A.AgentLicenseNum = BSC.AgentLicenseNum;

/* Get the name of the renter and their dependants from all rented properties */
SELECT C.FirstName, C.LastName, D.FirstName AS [Dependant Fname], D.LastName AS [Dependant Lname]
FROM Client C CROSS JOIN (Client_Dependants D CROSS JOIN RentalContract R)
WHERE C.ClientID = R.RenterClientID AND C.ClientID = D.ClientID;

/* Get the ClientID, FirstName, and number of properties owned by the Client */
SELECT C.ClientID, C.FirstName, Count(P.PropertyID) AS [No. of owned properties]
FROM Client C, Property P
WHERE C.ClientID = P.OwnerClientID
GROUP BY C.ClientID, C.FirstName;

/* Get Agent first name and email, as well as the mortgage amount from all Agents who worked on a contrage where the bank loaned a mortgage higher than $25000 */
SELECT A.FirstName, A.Email, BM.MortgageAmount
FROM Agent A JOIN (Bank_Mortgages_BuySellContract BM JOIN BuySellContract BS on BM.BuySellContractID = BS.BuySellContractID) ON A.AgentLicenseNum = BS.AgentLicenseNum
WHERE BM.MortgageAmount > 25000;