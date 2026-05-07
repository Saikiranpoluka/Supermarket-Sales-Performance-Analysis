# 🛒 Supermarket Sales Performance & Profitability Analysis

## 📌 Executive Summary
This project is an end-to-end Business Intelligence (BI) solution designed to uncover the key drivers of revenue, margin variations, and operational inefficiencies within a global supermarket chain. By engineering advanced SQL queries and visualizing the output in Power BI, this project transforms raw transactional data into actionable strategic insights.

## 🏗️ Data Architecture & Tech Stack
* **Database Engine:** MySQL (Data extraction, transformation, and complex aggregations)
* **Visualization & BI:** Power BI (Interactive dashboarding and executive reporting)
* **Analytical Techniques:** Window Functions, CTEs, Profit Margin Analysis, Geospatial Aggregation

## 📂 Dataset Attributes
The analysis evaluates a highly granular dataset spanning multiple operational dimensions:
* **Geographic & Customer Segmentation:** `Segment`, `Country`, `City`, `State`, `Postal-Code`, `Region`.
* **Product Taxonomy:** `Category` and `Subcategory` (e.g., Furniture, Technology, Office Supplies).
* **Financial & Supply Chain Metrics:** `Ship-Mode`, `Sales`, `Quantity`, `Discount`, `Profit`, `Unit Price`.

## 🔍 Key Business Questions Answered (SQL Phase)
Through robust SQL querying, the following operational realities were quantified:

1. **Profitability Tracking:** Calculated exact raw costs and margin percentages to isolate high-yield products versus loss-leaders.
2. **Regional Top Performers:** Pinpointed the highest-grossing cities within their respective regions and isolated the Top 3 most profitable branches in the US market.
3. **Revenue Leakage & Loss Analysis:** Engineered queries to identify the lowest-performing branches geographically, highlighting areas requiring immediate strategic intervention.
4. **Volume vs. Value:** Determined the velocity of inventory by ranking the top sales sub-categories by both quantity moved and unit price.
5. **Discount Impact Analysis:** Identified the Top 5 branches offering the highest average discounts to assess the erosion of profit margins, alongside calculating baseline revenue generation for key states (e.g., New York averaging $275.59 per transaction).

## 📊 Executive Dashboard (Power BI Phase)
The extracted SQL data was ingested into Power BI to create a dynamic, user-friendly interface for stakeholders. *([Optional: Insert a screenshot of your Power BI dashboard here])*

**Dashboard Features:**
* Dynamic filtering by Region, Category, and Timeframe.
* Visual distribution of profit margins across different Product Subcategories.
* Geospatial heatmaps highlighting revenue concentration by US State.

## 🚀 How to Use This Repository
1. The `SQL_Queries/` folder contains the raw SQL scripts used for data extraction and EDA.
2. The `Data/` folder contains the initial structural outlines of the dataset.
3. The `Dashboard/` folder contains the `.pbix` file for the Power BI visualizations.

---
*Developed to showcase enterprise-level data manipulation, relational database management, and business intelligence reporting.*
