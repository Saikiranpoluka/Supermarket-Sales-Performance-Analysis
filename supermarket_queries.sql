SUPERMARKET SALES PERFORMANCE ANALYSIS
Author: P. V. Sai Kiran Reddy
Dataset: samplesuperstore

1. Display the ship mode, sub-category, profit, sales, and raw cost of the product.
SELECT 
    `Ship Mode`, 
    `Sub-Category`, 
    Profit, 
    Sales, 
    (Sales - Profit) AS raw_cost
FROM samplesuperstore 
ORDER BY raw_cost DESC;


2. Display the ship mode, sub-category, profit, sales, and margin percentage.
SELECT 
    `Ship Mode`, 
    `Sub-Category`, 
    Profit, 
    Sales, 
    ROUND((Profit / Sales) * 100, 1) AS margin_percentage
FROM samplesuperstore
ORDER BY margin_percentage DESC;


3. Display the cities getting the highest margin percentage in the United States.
SELECT 
    `Ship Mode`, 
    Country, 
    City, 
    `Sub-Category`, 
    Profit, 
    Sales, 
    ROUND((Profit / Sales) * 100, 1) AS margin_percentage
FROM samplesuperstore
WHERE Country = 'United States'
ORDER BY margin_percentage DESC;


4. Display the cities getting the highest margin percentage in the US starting with the letter 'S'.
SELECT 
    `Ship Mode`, 
    Country, 
    City, 
    `Sub-Category`, 
    Profit, 
    Sales, 
    ROUND((Profit / Sales) * 100, 1) AS margin_percentage
FROM samplesuperstore
WHERE Country = 'United States' AND City LIKE 'S%'
ORDER BY margin_percentage DESC;


5. Display the top performing cities in each region based on sales.
WITH RegionalSales AS (
    SELECT 
        City, 
        Region, 
        `Sub-Category`, 
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY City, Region, `Sub-Category`
),
RankedSales AS (
    SELECT 
        *, 
        RANK() OVER (PARTITION BY Region ORDER BY Total_Sales DESC) AS Rank_In_Region
    FROM RegionalSales
)
SELECT * FROM RankedSales
WHERE Rank_In_Region = 1;


6. Display the top 3 profitable branches (orders) in the United States.
SELECT 
    `Ship Mode`, 
    Country, 
    `Postal Code`, 
    City, 
    `Sub-Category`, 
    Profit
FROM samplesuperstore
WHERE Country = 'United States'
ORDER BY Profit DESC
LIMIT 3;


7. Display the top profitable cities in each category.
WITH CityCategorySales AS (
    SELECT 
        `Ship Mode`, 
        Country, 
        `Postal Code`, 
        City, 
        `Sub-Category`, 
        Profit, 
        Category, 
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY `Ship Mode`, Country, `Postal Code`, City, `Sub-Category`, Profit, Category
),
RankedSales AS (
    SELECT 
        *, 
        RANK() OVER (PARTITION BY Category ORDER BY Total_Sales DESC) AS ranks
    FROM CityCategorySales
)
SELECT * FROM RankedSales
WHERE ranks = 1;


8. Display the top losers (least profitable) from their respective region.
WITH RegionalProfit AS (
    SELECT 
        City, 
        Region, 
        `Postal Code`, 
        `Sub-Category`, 
        SUM(Profit) AS Total_Profit
    FROM samplesuperstore
    GROUP BY City, Region, `Sub-Category`, `Postal Code`
), 
RankedProfit AS (
    SELECT 
        *,
        RANK() OVER(PARTITION BY Region ORDER BY Total_Profit ASC) AS Rank_In_Region
    FROM RegionalProfit
)
SELECT * FROM RankedProfit
WHERE Rank_In_Region = 1;


9. Display the top sales sub-category by quantity.
SELECT 
    Region, 
    Category, 
    `Sub-Category`, 
    Sales, 
    Quantity
FROM samplesuperstore
ORDER BY Quantity DESC
LIMIT 5;


10. Display the top 5 individual orders with the highest quantity of items sold in the South Region.
SELECT 
    Region, 
    Category, 
    `Sub-Category`, 
    Sales, 
    Quantity
FROM samplesuperstore
WHERE Region = 'South'
ORDER BY Quantity DESC
LIMIT 5;


11. Display the unit price of the top 5 highest quantity orders.
SELECT 
    Region, 
    Category, 
    `Sub-Category`, 
    Sales, 
    Quantity, 
    (Sales / Quantity) AS unit_price
FROM samplesuperstore
ORDER BY Quantity DESC
LIMIT 5;


12. Display the top 5 sold sub-categories with their unit price that shipped via First Class.
SELECT 
    `Ship Mode`, 
    Region, 
    Category, 
    `Sub-Category`, 
    Sales, 
    Quantity, 
    (Sales / Quantity) AS unit_price
FROM samplesuperstore
WHERE `Ship Mode` = 'First Class'
ORDER BY Quantity DESC
LIMIT 5;


13. Display details of the top 3 highest order sales valued branches with unit price and profit/loss analysis.
SELECT 
    `Ship Mode`, 
    Country, 
    City, 
    State, 
    `Postal Code`, 
    Region, 
    Category, 
    `Sub-Category`, 
    Sales, 
    Quantity, 
    Profit, 
    (Sales / Quantity) AS unit_price,
    CASE 
        WHEN (Profit / Quantity) > 0 THEN 'Profit' 
        ELSE 'Loss' 
    END AS unit_analysis
FROM samplesuperstore
ORDER BY Sales DESC
LIMIT 3;


14. Display the top 5 branches offering the highest average discount.
SELECT 
    Country, 
    City, 
    `Postal Code`, 
    AVG(Discount) AS avg_discount
FROM samplesuperstore
GROUP BY Country, City, `Postal Code`
ORDER BY avg_discount DESC
LIMIT 5;


15. Display cities that have an above-average total profit compared to the average total profit of all cities.
WITH CityProfits AS (
    SELECT 
        State, 
        City, 
        `Postal Code`, 
        SUM(Profit) AS total_profit
    FROM samplesuperstore
    GROUP BY State, City, `Postal Code`
)
SELECT * FROM CityProfits
WHERE total_profit > (SELECT AVG(total_profit) FROM CityProfits);


16. Display the unique categories and the count of their respective unique sub-categories.
SELECT 
    Category, 
    COUNT(DISTINCT `Sub-Category`) AS total_unique_subcategories
FROM samplesuperstore
GROUP BY Category;


17. Display the unique ship modes and how many orders we get from each.
SELECT 
    `Ship Mode`, 
    COUNT(`Ship Mode`) AS total_no_of_shipment
FROM samplesuperstore
GROUP BY `Ship Mode`;


18. Display the count of orders/branches grouped by state.
SELECT 
    State, 
    COUNT(City) AS no_of_branches
FROM samplesuperstore
GROUP BY State;


19. Display branches whose average sold quantity is above the overall average quantity.
SELECT 
    City, 
    `Postal Code`, 
    AVG(Quantity) AS above_avg
FROM samplesuperstore
GROUP BY City, `Postal Code`
HAVING AVG(Quantity) > (SELECT AVG(Quantity) FROM samplesuperstore);


20. Display the count of orders/branches in states whose name starts with 'G'.
SELECT 
    State, 
    COUNT(City) AS no_of_branches
FROM samplesuperstore
WHERE State LIKE 'G%'
GROUP BY State;


21. Display the details of the top 3 states that have the lowest number of branches/orders.
SELECT 
    t1.State, 
    t1.City, 
    t1.`Postal Code`, 
    t1.Sales, 
    t1.Profit,
    t2.Total_branches
FROM samplesuperstore t1
JOIN (
    SELECT 
        State, 
        COUNT(*) AS Total_branches
    FROM samplesuperstore
    GROUP BY State
    ORDER BY COUNT(*) ASC
    LIMIT 3
) t2 ON t1.State = t2.State
ORDER BY t2.Total_branches ASC, t1.State;


22. Display the states and count of branches using the 'First Class' ship mode.
SELECT 
    State, 
    `Ship Mode`, 
    COUNT(City) AS no_of_branches
FROM samplesuperstore
WHERE `Ship Mode` = 'First Class'
GROUP BY State, `Ship Mode`
ORDER BY no_of_branches;


23. Check if there is any store having the postal code '19140'.
SELECT *
FROM samplesuperstore
WHERE `Postal Code` = 19140
LIMIT 1;


24. Display unique branches in the consumer segment, sorted by ship mode.
WITH ConsumerBranches AS (
    SELECT 
        `Ship Mode`, 
        Segment, 
        Region, 
        Country, 
        City, 
        State, 
        `Postal Code`
    FROM samplesuperstore
    WHERE Segment = 'Consumer'
)
SELECT DISTINCT * FROM ConsumerBranches
ORDER BY `Ship Mode`;


25. Find the average revenue generated by New York state.
SELECT 
    AVG(Sales) AS average_revenue_usd
FROM samplesuperstore
WHERE State = 'New York';