CREATE OR ALTER PROCEDURE Inventory.load_Inventory AS

BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 

	BEGIN TRY
		SET @batch_start_time = GETDATE();

		PRINT '======================================================'
		PRINT 'LOADING THE INVENTORY LAYER'
		PRINT '======================================================'



		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Inventory.PurchasesFINAL12312016'
		TRUNCATE TABLE Inventory.PurchasesFINAL12312016;

		PRINT '>> Inserting Data Into Table: Inventory.PurchasesFINAL12312016'
		BULK INSERT Inventory.PurchasesFINAL12312016 
		FROM 'C:\Users\Ifeoluwa Saola\Downloads\Preprocessed Dataset\PurchasesFINAL12312016.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = '|' ,
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Inventory.InvoicePurchases12312016'
		TRUNCATE TABLE Inventory.InvoicePurchases12312016;

		PRINT '>> Inserting Data Into Table: Inventory.InvoicePurchases12312016'
		BULK INSERT Inventory.InvoicePurchases12312016
		FROM 'C:\Users\Ifeoluwa Saola\Downloads\Preprocessed Dataset\InvoicePurchases12312016.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = '|' ,
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Inventory.SalesFINAL12312016'
		TRUNCATE TABLE Inventory.SalesFINAL12312016;

		PRINT '>> Inserting Data Into Table: Inventory.SalesFINAL12312016'
		BULK INSERT Inventory.SalesFINAL12312016
		FROM 'C:\Users\Ifeoluwa Saola\Downloads\Preprocessed Dataset\SalesFINAL12312016.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = '|' ,
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Inventory.PurchasesFINAL12312016'
		TRUNCATE TABLE Inventory.EndInvFINAL12312016;

		PRINT '>> Inserting Data Into Table: Inventory.EndInvFINAL12312016'
		BULK INSERT Inventory.EndInvFINAL12312016
		FROM 'C:\Users\Ifeoluwa Saola\Downloads\Preprocessed Dataset\EndInvFINAL12312016.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = '|' ,
			ROWTERMINATOR = '\n',
			TABLOCK
		)
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Inventory.BegInvFINAL12312016'
		TRUNCATE TABLE Inventory.BegInvFINAL12312016;

		PRINT '>> Inserting Data Into Table: Inventory.BegInvFINAL12312016'
		BULK INSERT Inventory.BegInvFINAL12312016
		FROM 'C:\Users\Ifeoluwa Saola\Downloads\Preprocessed Dataset\BegInvFINAL12312016.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = '|' ,
			ROWTERMINATOR = '\n',
			TABLOCK
		)
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Inventory.PurchasePricesDec2017'
		TRUNCATE TABLE Inventory.PurchasePricesDec2017;

		PRINT '>> Inserting Data Into Table: Inventory.PurchasePricesDec2017'
		BULK INSERT Inventory.PurchasePricesDec2017
		FROM 'C:\Users\Ifeoluwa Saola\Downloads\Preprocessed Dataset\2017PurchasePricesDec.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = '|' ,
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		--SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Inventory Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='


	END TRY

	BEGIN CATCH
	PRINT '======================================================'
	PRINT 'ERROR OCCURED WHILE LOADING LAYERS'
	PRINT 'Error Message:' + ERROR_MESSAGE(); 
	PRINT 'Error Message:' + CAST (ERROR_NUMBER() AS NVARCHAR); 
	PRINT 'Error Message:' + CAST (ERROR_STATE() AS NVARCHAR);
	PRINT '======================================================'

	END CATCH

END
--C:\Users\Ifeoluwa Saola\Downloads\Inventory Dataset\PurchasesFINAL12312016.csv,  PurchasePricesDec--
--C:\Users\Ifeoluwa Saola\Downloads\Inventory Dataset\InvoicePurchases12312016.csv--
--C:\Users\Ifeoluwa Saola\Downloads\Inventory Dataset\SalesFINAL12312016.csv
--C:\Users\Ifeoluwa Saola\Downloads\Inventory Dataset\EndInvFINAL12312016.csv
--C:\Users\Ifeoluwa Saola\Downloads\Inventory Dataset\BegInvFINAL12312016.csv
--C:\Users\Ifeoluwa Saola\Downloads\Inventory Dataset\2017PurchasePricesDec.csv

