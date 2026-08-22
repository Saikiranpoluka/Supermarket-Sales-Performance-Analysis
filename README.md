# 🛒 Supermarket Sales Performance & Profitability Analysis

> An end-to-end business intelligence project that combines **MySQL, SQL analytics, Power BI, and DAX** to analyze sales, profitability, regional performance, discounts, and revenue leakage.

## 📌 Executive Summary

This project transforms transactional supermarket sales data into business insights for understanding **where revenue is generated, where profit is lost, and which products, regions, and customer segments require attention**.

The workflow uses MySQL for data preparation and analytical SQL, followed by Power BI for interactive reporting and executive-style visualization.

## 🎯 Business Questions

The analysis focuses on:

- Which regions, states, cities, categories, and subcategories drive sales and profit?
- Which products or branches generate low or negative margins?
- How do discounts affect profitability?
- Which locations have high sales but weak profit performance?
- Which subcategories have the strongest volume versus value contribution?
- How can stakeholders identify revenue leakage and operational opportunities?

## 🔄 Analytics Workflow

```text
Raw Transaction Data
        ↓
MySQL Import & Validation
        ↓
SQL Cleaning / Transformation
        ↓
CTEs + Window Functions + Aggregations
        ↓
Business Metrics
        ↓
Power BI Data Model
        ↓
DAX Measures
        ↓
Interactive Executive Dashboard
```

## 🗄️ SQL Analysis

The SQL phase includes:

- Common Table Expressions (CTEs)
- Window functions and ranking
- Aggregations by geography and product hierarchy
- Profit and margin calculations
- Discount analysis
- Top-N analysis
- Regional and city-level comparisons
- Revenue leakage / loss identification

### Example business analyses

**Profitability:** Identify high-margin products and loss-making product groups.

**Regional performance:** Rank cities and locations within regions based on sales and profit.

**Discount impact:** Compare average discount levels with profitability to identify potential margin erosion.

**Volume vs. value:** Compare quantity sold with sales and unit-price characteristics across subcategories.

## 📊 Power BI Dashboard

The Power BI layer is designed for interactive exploration of the SQL-derived metrics.

### Dashboard capabilities

- Region, category, and time-based filtering
- Sales and profit KPIs
- Profit-margin analysis by product hierarchy
- Regional and state-level performance
- Discount and profitability analysis
- Product/subcategory ranking
- Geographic visualization of revenue concentration

> **Dashboard note:** Add 1–3 screenshots or a short GIF of the final `.pbix` dashboard here. A visual preview is highly recommended for a portfolio repository.

## 🛠️ Tech Stack

| Area | Technologies |
|---|---|
| Database | MySQL |
| Querying | SQL, CTEs, Window Functions |
| BI | Microsoft Power BI |
| Calculations | DAX |
| Data Analysis | Aggregation, Ranking, Margin Analysis |

## 📂 Repository Structure

```text
Supermarket-Sales-Performance-Analysis/
├── SQL_Queries/
│   └── *.sql
├── Data/
│   └── dataset documentation / source structure
├── Dashboard/
│   └── *.pbix
└── README.md
```

## 📈 Key Findings

The analysis reported several useful patterns, including:

- Identification of high- and low-profit product groups.
- Regional and city-level differences in sales performance.
- Locations with comparatively high discounting and potential margin pressure.
- Differences between sales volume and monetary value across subcategories.
- Geographic concentration of revenue across US states.

> For a stronger portfolio presentation, add the exact headline KPIs and final business recommendations from the completed Power BI dashboard here rather than relying only on descriptive findings.

## 💡 Business Recommendations

The analysis can support decisions such as:

1. Review high-discount locations where margin erosion is significant.
2. Investigate high-sales/low-profit product groups for pricing or discount optimization.
3. Prioritize high-margin categories and regions for growth initiatives.
4. Monitor loss-making products and locations using recurring Power BI reports.
5. Combine sales, profit, discount, and volume metrics instead of optimizing for revenue alone.

## 🚀 How to Use

### SQL analysis

1. Import the source dataset into MySQL.
2. Review the scripts in `SQL_Queries/`.
3. Execute the analytical queries against the prepared tables.
4. Use the resulting metrics for validation and reporting.

### Power BI

1. Open the `.pbix` file in Power BI Desktop.
2. Refresh the data connection according to your local MySQL configuration.
3. Explore the dashboard using the available filters and visuals.

## 🔮 Future Improvements

- Add a documented Power BI data model and star-schema design.
- Add a dedicated Date dimension for time intelligence.
- Add DAX measures for YoY growth, rolling averages, margin %, and contribution %.
- Automate the MySQL → Power BI refresh workflow.
- Add data-quality checks before dashboard refresh.
- Add a documented executive KPI page with clear targets and recommendations.

## 📌 Portfolio Focus

This project demonstrates practical skills in **SQL analytics, relational data analysis, Power BI dashboarding, DAX, KPI development, and business-oriented storytelling**.
