# E-commerce Sales & Customer Analytics

This project is a complete end-to-end business analytics case study built around a retail sales dataset. It follows a realistic workflow using Excel for data cleaning and validation, MySQL for analytical querying, and Power BI for dashboarding and business storytelling.

## Project Objective

Retail businesses often collect large volumes of sales transactions, but raw data alone does not explain which products, customers, or regions are driving revenue and profitability. This project transforms fragmented transaction data into business insight.

The key objective is to answer the following questions:

- Which product categories and sub-categories drive the highest sales and profit?
- Which regions and states perform best or worst?
- Which customer segments contribute most to revenue?
- How do discounts affect sales and profit?
- Which products generate high sales but low or negative profit?
- How have sales and profit changed over time?
- Which customers contribute the most revenue?
- What actions can improve profitability?

## Business Context

The project uses a Superstore-style e-commerce dataset that contains sales, profit, customer, product, and regional information. The analysis focuses on improving decision-making around products, pricing, discounting, regions, and customer segments.

## Tools Used

- Microsoft Excel: Data cleaning, validation, basic exploration, and quality checks
- MySQL: Data preparation, joins, aggregations, filtering, KPIs, and business analysis
- Microsoft Power BI: Interactive dashboarding, KPI visuals, and executive reporting

## Project Workflow

1. Data collection and understanding
2. Excel-based cleaning and validation
3. MySQL schema and data loading
4. SQL analysis for KPI and trend extraction
5. Power BI dashboard design and storytelling
6. Business recommendations and presentation

## Project Structure

```text
New Data Analyst Project/
├── README.md
├── .gitignore
├── data/
│   └── superstore_sales.csv
├── sql/
│   ├── 01_create_schema.sql
│   ├── 02_load_data.sql
│   └── 03_business_analysis_queries.sql
├── excel/
│   └── cleaning_steps.md
├── powerbi/
│   ├── dashboard_blueprint.md
│   ├── dashboard_setup_guide.md
│   ├── ecommerce_dashboard_theme.json
│   └── powerbi_dax_measures.txt
├── docs/
│   └── project_summary.md
└── LICENSE
```

## Dataset Overview

The sample dataset contains 180 rows and includes fields such as:

- Order ID
- Order Date
- Ship Date
- Ship Mode
- Customer ID and Name
- Segment
- Country, State, City, Region
- Product ID, Category, Sub-Category, Product Name
- Sales
- Quantity
- Discount
- Profit
- Payment Mode

## Business Questions Covered

1. Which categories and sub-categories generate the highest sales and profit?
2. Which regions and states perform best and worst?
3. Which customer segments contribute most to revenue?
4. How do discounts impact profitability?
5. Which products have high sales but poor margins?
6. Which months or periods show strong growth or decline?
7. Which customers are the top revenue contributors?
8. What recommendations can improve overall business health?

## Excel Tasks

Use Excel to:

- Remove duplicate orders or records
- Validate date formats
- Check missing values in required fields
- Standardize segment, region, and category values
- Confirm sales, profit, and discount columns are numeric
- Create basic pivot tables for preliminary insights

## MySQL Tasks

Create a database, import the cleaned dataset, and run queries to calculate:

- Total sales, total profit, and profit margin
- Sales and profit by category and sub-category
- Regional and state-level performance
- Customer segment analysis
- Discount impact analysis
- Monthly sales/profit trends
- High-revenue / low-profit products

## Power BI Tasks

Build a business dashboard with:

- KPI cards for sales, profit, and profit margin
- Sales by category and sub-category
- Regional sales and profit map or bar charts
- Discount impact analysis
- Segment-wise revenue distribution
- Monthly trend analysis
- Top 10 customers by revenue
- Product performance analysis

## Recommended Dashboard Layout

A practical dashboard can include:

- Top-left: Sales, Profit, Profit Margin, Orders
- Top-right: Sales by Region
- Middle-left: Sales by Category
- Middle-right: Profit by Segment
- Bottom-left: Discount vs Profit
- Bottom-right: Top Customers or Top Products

## Data Quality Assumptions

This sample project assumes:

- Each record represents one order line item
- A single order can include multiple products
- Profit may be negative for some product lines
- Discount values are expressed as percentages or decimal fractions depending on the source data
- Missing or inconsistent fields will be cleaned in Excel before importing to MySQL

## How to Run This Project

### 1. Prepare the data

Use the sample file in `data/superstore_sales.csv` as a starting point.

### 2. Clean the data in Excel

Follow the steps described in `excel/cleaning_steps.md`.

### 3. Create MySQL schema and import the file

Use the scripts in `sql/`:

- `01_create_schema.sql`
- `02_load_data.sql`
- `03_business_analysis_queries.sql`

### 4. Build the Power BI dashboard

Use the design guidance in `powerbi/dashboard_blueprint.md`.

## Expected Outcomes

By the end of this project, you will have:

- Cleaned and structured retail sales data
- Query-ready SQL tables and business metrics
- A reusable analytics workflow
- An executive dashboard for business decision-making
- A presentation-ready project for GitHub or portfolio use

## Use for Portfolio

This project is suitable for:

- Data analytics portfolios
- SQL and BI case studies
- Resume project examples
- Business intelligence demos

## License

This project is intended for learning and portfolio use.

## Notes

This repository contains a sample dataset and SQL logic designed for a realistic analytics workflow. You can replace the sample data with a real-world Superstore dataset for a more advanced version.
