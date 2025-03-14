-- 1. Demand Forecasting: Summarizing past sales data
CREATE VIEW Inventory.demand_forecast AS
SELECT InventoryId, Store, SUM(SalesQuantity) AS TotalSales, AVG(SalesQuantity) AS AvgSales
FROM Inventory.SalesFINAL12312016
GROUP BY InventoryId, Store;

-- 2. ABC Analysis: Classifying inventory based on sales revenue contribution
CREATE VIEW Inventory.ABC_Analysis AS
WITH SalesRevenue AS (
    SELECT InventoryId, SUM(SalesDollars) AS TotalRevenue
    FROM Inventory.SalesFINAL12312016
    GROUP BY InventoryId
), RankedItems AS (
    SELECT InventoryId, TotalRevenue,
           PERCENT_RANK() OVER (ORDER BY TotalRevenue DESC) AS Rank
    FROM SalesRevenue
)
SELECT InventoryId, TotalRevenue,
       CASE 
           WHEN Rank <= 0.2 THEN 'A'
           WHEN Rank <= 0.5 THEN 'B'
           ELSE 'C'
       END AS ABC_Category
FROM RankedItems;

-- 3. EOQ Calculation
CREATE VIEW Inventory.EOQ_Calculation AS
SELECT p.InventoryId, 
       SQRT((2 * SUM(p.PurchasePrice * p.Quantity)) / NULLIF(AVG(pp.Price), 0)) AS EOQ
FROM Inventory.PurchasesFINAL12312016 p
JOIN Inventory.PurchasePricesDec2017 pp ON p.VendorNumber = pp.VendorNumber
GROUP BY p.InventoryId;

-- 4. Reorder Point Calculation
CREATE VIEW Inventory.Reorder_Point AS
WITH LeadTimeData AS (
    SELECT InventoryId, AVG(DATEDIFF(day, PODate, ReceivingDate)) AS LeadTime
    FROM Inventory.PurchasesFINAL12312016
    GROUP BY InventoryId
)
SELECT s.InventoryId, s.Store, 
       AVG(s.SalesQuantity) * MAX(ld.LeadTime) AS ReorderPoint
FROM Inventory.SalesFINAL12312016 s
JOIN LeadTimeData ld ON s.InventoryId = ld.InventoryId
GROUP BY s.InventoryId, s.Store;

-- 5. Lead Time Analysis
CREATE VIEW Inventory.Lead_Time_Analysis AS
SELECT InventoryId, AVG(DATEDIFF(day, PODate, ReceivingDate)) AS AvgLeadTime
FROM Inventory.PurchasesFINAL12312016
GROUP BY InventoryId;

-- 6. Carrying Cost Analysis
CREATE VIEW Inventory.Carrying_Cost AS
SELECT e.InventoryId, e.Store, AVG(e.Price) * AVG(e.onHand) AS CarryingCost
FROM Inventory.EndInvFINAL12312016 e
GROUP BY e.InventoryId, e.Store;

-- 7. Inventory Turnover Analysis
CREATE VIEW Inventory.Inventory_Turnover AS
SELECT s.InventoryId, s.Store, 
       SUM(s.SalesQuantity) / NULLIF(AVG(e.onHand), 0) AS TurnoverRatio
FROM Inventory.SalesFINAL12312016 s
JOIN Inventory.EndInvFINAL12312016 e ON s.InventoryId = e.InventoryId AND s.Store = e.Store
GROUP BY s.InventoryId, s.Store;
