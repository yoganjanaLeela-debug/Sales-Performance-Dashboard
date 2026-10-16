# Sales Performance Dashboard | Power BI

An interactive Power BI dashboard built to analyze sales performance using the Sample Superstore dataset. It provides an executive overview of orders, customers, sales, profit, regional performance, product performance, and monthly sales trends.

## Dashboard Preview

![Sales Performance Dashboard](images/sales-performance-dashboard.png)

## Project Overview

The dashboard helps users explore sales performance across product categories, regions, years, and customers. It combines KPI cards, charts, slicers, and tables into a single executive-style report.

## Key KPIs

- **Total Orders:** 10K
- **Total Customers:** 804
- **Total Sales:** 2.33M
- **Total Profit:** 292.30K
- **Average Order Value:** 228.23

*These values reflect the dashboard screenshot and may change depending on the selected filters and underlying data.*

## Dashboard Features

- **Executive KPI cards** for orders, customers, sales, profit, and average order value.
- **Sales by Category** to compare Technology, Furniture, and Office Supplies.
- **Sales by Region** to compare regional performance.
- **Monthly Sales Trend** to review sales changes throughout the year.
- **Interactive slicers** for Region, Year, and Category.
- **Top Products table** showing product-level quantity and sales.
- **Top Customers visualizations** to identify high-value customers.
- **Top 10 Products chart** ranked by quantity.
- **Category-wise Sales & Profit** comparison.

## Tools and Technologies

- **Power BI Desktop** — dashboard development and data visualization
- **Power Query** — data preparation and transformation
- **DAX** — measures and KPI calculations
- **SQL** — querying and exploring sales data
- **CSV / Excel** — source data and supporting files

## Repository Contents

| File | Description |
|---|---|
| `Sales Performance Dashboard.pbix` | Power BI report file |
| `Sales_Performance_Dashboard.xlsx` | Excel workbook used for supporting data or analysis |
| `Sales Performance.sql` | SQL queries for sales analysis |
| `sample_superstore_postgres.csv` | Superstore dataset in CSV format |

## How to Use

1. Download or clone this repository.
2. Open `Sales Performance Dashboard.pbix` in Power BI Desktop.
3. If Power BI asks for the data source, select the correct CSV or Excel file and update the file path.
4. Refresh the data if needed.
5. Use the Region, Year, and Category slicers to explore the report.

## Example Business Questions

- Which product category generates the highest sales?
- Which region contributes the most to sales?
- How do sales change month by month?
- Which products sell the highest quantities?
- Who are the top customers by sales?
- How do sales and profit compare across categories?

## Notes

- KPI values and chart results depend on the connected dataset, filters, and measure definitions.
- If you share the `.pbix` file, make sure the data source paths are configured correctly on the recipient's computer.
- Only include datasets you are permitted to redistribute.

## Author

**Yoganjana**

GitHub: [yoganjanaLeela-debug](https://github.com/yoganjanaLeela-debug)
