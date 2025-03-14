--CREATE SCHEMA Inventory;

IF OBJECT_ID ('Inventory.PurchasesFINAL12312016', 'U') IS NOT NULL
	DROP TABLE Inventory.PurchasesFINAL12312016;
CREATE TABLE Inventory.PurchasesFINAL12312016(
	InventoryId NVARCHAR(50),
	Store INT,
	Brand NVARCHAR(50),
	Description_ NVARCHAR(100),
	Size NVARCHAR(50),
	VendorNumber INT,
	VendorName NVARCHAR(100),
	PONumber INT,
	PODate DATE,
	ReceivingDate DATE,
	InvoiceDate DATE,
	PayDate DATE,
	PurchasePrice FLOAT,
	Quantity INT,
	Dollars FLOAT,
	Classification_ INT
);

IF OBJECT_ID ('Inventory.InvoicePurchases12312016', 'U') IS NOT NULL
	DROP TABLE Inventory.InvoicePurchases12312016;
CREATE TABLE Inventory.InvoicePurchases12312016(
	VendorNumber INT,
	VendorName NVARCHAR(100),
	InvoiceDate DATE,
	PONumber INT,
	PODate DATE,
	PayDate DATE,
	Quantity INT,
	Dollars FLOAT,
	Freight FLOAT,
	Approval NVARCHAR(50)
);

IF OBJECT_ID ('Inventory.SalesFINAL12312016', 'U') IS NOT NULL
	DROP TABLE Inventory.SalesFINAL12312016;
CREATE TABLE Inventory.SalesFINAL12312016(
	InventoryId NVARCHAR(50),
	Store INT,
	Brand INT,
	Description_ NVARCHAR(100),
	Size NVARCHAR(50),
	SalesQuantity INT,
	SalesDollars FLOAT,
	SalesPrice FLOAT,
	SalesDate DATE,
	Volume INT,
	Classification_ INT,
	ExciseTax FLOAT,
	VendorNo INT,
	VendorName NVARCHAR(100)
);

IF OBJECT_ID ('Inventory.EndInvFINAL12312016', 'U') IS NOT NULL
	DROP TABLE Inventory.EndInvFINAL12312016;
CREATE TABLE Inventory.EndInvFINAL12312016(
	InventoryId NVARCHAR(50),
	Store INT,
	City NVARCHAR(50),
	Brand INT,
	Description_ NVARCHAR(100),
	Size NVARCHAR(50),
	onHand INT,
	Price FLOAT,
	endDate DATE
);

IF OBJECT_ID ('Inventory.BegInvFINAL12312016', 'U') IS NOT NULL
	DROP TABLE Inventory.BegInvFINAL12312016;
CREATE TABLE Inventory.BegInvFINAL12312016(
	InventoryId NVARCHAR(50),
	Store INT,
	City NVARCHAR(50),
	Brand INT,
	Description_ NVARCHAR(100),
	Size NVARCHAR(50),
	onHand INT,
	Price FLOAT,
	startDate DATE
);

IF OBJECT_ID ('Inventory.PurchasePricesDec2017', 'U') IS NOT NULL
	DROP TABLE Inventory.PurchasePricesDec2017;
CREATE TABLE Inventory.PurchasePricesDec2017(
	Brand INT,
	Description_ NVARCHAR(100),
	Price FLOAT,
	Size NVARCHAR(50),
	Volume NVARCHAR(50),
	Classification_ INT,
	PurchasePrice FLOAT,
	VendorNumber INT,
	VendorName NVARCHAR(100),

);
