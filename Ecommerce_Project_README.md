# E-Commerce Customer, Order & Operations Analytics

## Project Overview
This is an end-to-end e-commerce analytics project built using Python, Pandas, SQL, and Tableau Public.

The project analyzes customer behavior, order performance, product performance, geography, shipping, cancellations, returns, and operational performance using five connected e-commerce tables.

The goal is to transform raw multi-table data into clean analytical datasets, business KPIs, SQL analysis, and interactive Tableau dashboards that support business decision-making.

## Tools Used
- Python
- Pandas
- Matplotlib
- SQL
- Tableau Public
- Google Colab

## Dataset
The project uses five connected CSV tables:
- `customers.csv`: Customer profile and location details
- `orders.csv`: Order, payment, shipping, discount, and status information
- `order_items.csv`: Products and quantities inside each order
- `products.csv`: Product, category, brand, stock, price, and rating information
- `reviews.csv`: Customer ratings and review information

The tables are connected using `customer_id`, `order_id`, and `product_id`.

## Project Workflow

### 1. Data Understanding and Cleaning
- Loaded all five CSV files
- Checked rows, columns, data types, and missing values
- Converted date fields to datetime format
- Handled meaningful missing values
- Checked duplicate records and duplicate customer emails
- Standardized text fields
- Checked invalid numerical values
- Validated order-item subtotal calculations
- Validated relationships between connected tables
- Created year, month, and year-month fields
- Created delivered, cancelled, and returned status flags
- Saved cleaned datasets for further analysis

### 2. Exploratory Data Analysis
Analyzed revenue, orders, customers, average order value, units sold, discounts, cancellation rate, return rate, customer ratings, categories, products, provinces, payment methods, couriers, and order-status distribution.

### 3. Customer and Order Analysis
Analyzed orders per customer, one-time and repeat customers, repeat rate, customer spending, top customers, average customer spend, age groups, and items per order.

### 4. Operations and Shipping Analysis
Analyzed delivered, cancelled, and returned orders, courier volumes, order statuses, average shipping cost, and shipping cost by province.

### 5. SQL Analysis
Used SQL to analyze KPIs and business performance across customers, orders, products, geography, and operations.

### 6. Tableau Dashboards

#### Dashboard 1: Executive Overview
KPIs:
- Total Revenue: **Rp877.8M**
- Total Orders: **3,000**
- Total Customers: **787**
- Average Order Value: **Rp494.23K**
- Cancellation Rate: **10.93%**
- Return Rate: **5.03%**

Highlights:
- Dress was the highest-revenue category at **Rp259.7M**
- Jawa Barat was the highest-revenue province at **Rp169.1M**
- Revenue fluctuated over time but finished near its strongest levels

#### Dashboard 2: Customer & Product Analysis
KPIs:
- Total Customers: **787**
- Repeat Customers: **509**
- One-Time Customers: **278**
- Repeat Rate: **64.68%**
- Average Customer Spend: **Rp1.22M**
- Total Units Sold: **6,440**

Highlights:
- Age group 25-34 generated the highest revenue at **Rp372.9M**
- Hadi Fauzi was the highest-spending customer at approximately **Rp7.8M**
- The highest-revenue product shown in the dashboard generated approximately **Rp23.0M**

#### Dashboard 3: Operations & Shipping
KPIs:
- Delivered Orders: **1,776**
- Cancelled Orders: **328**
- Returned Orders: **151**
- Average Shipping Cost: **Rp23.42K**
- Cancellation Rate: **10.93%**
- Return Rate: **5.03%**

Highlights:
- J&T handled **896** orders
- JNE handled **845** orders
- SiCepat handled **791** orders
- Sulawesi Utara had the highest average shipping cost shown at approximately **Rp38.33K**
- Order statuses also included **445 shipped** and **300 processing** orders

## Key Business Insights
1. The business generated **Rp877.8M** in delivered revenue from **3,000** total orders.
2. Dress was the strongest category, generating **Rp259.7M**.
3. Jawa Barat was the strongest province by revenue, generating **Rp169.1M**.
4. Repeat customers were the majority with **509 customers**, representing **64.68%**.
5. The 25-34 age group generated the highest revenue at **Rp372.9M**.
6. Hadi Fauzi was the highest-spending customer at approximately **Rp7.8M**.
7. The project recorded **328 cancelled orders** and **151 returned orders**.
8. J&T handled the largest courier order volume, while Sulawesi Utara had the highest average shipping cost shown.

## Business Recommendations
1. Investigate cancellation drivers by payment method, product category, province, and courier.
2. Review returned orders by product and category to identify recurring issues.
3. Use retention campaigns to convert one-time customers into repeat customers.
4. Prioritize the 25-34 age group in targeted campaigns while testing other segments.
5. Maintain strong stock availability and merchandising for Dress and other top products.
6. Use Jawa Barat as a priority market for growth and retention.
7. Review shipping costs in high-cost provinces such as Sulawesi Utara.
8. Monitor high-volume couriers such as J&T, JNE, and SiCepat for quality, cost, cancellations, and returns.

## Project Structure
```text
Ecommerce-Order-Shipping-Analytics/
  data/
    Raw/
    Processed/
  notebooks/
    01_Data_Understanding_Cleaning.ipynb
    02_EDA.ipynb
    03_Customer_Order_Analysis.ipynb
    04_Operations_Analysis.ipynb
  sql/
    Ecommerce_SQL_Analysis.sql
  dashboard/
    Dashboard_1_Executive_Overview.png
    Dashboard_2_Customer_Product_Analysis.png
    Dashboard_3_Operations_Shipping.png
  docs/
    Business_Insights_and_Recommendations.md
  README.md
```

## Conclusion
This project demonstrates a complete analytics workflow from raw multi-table data through data cleaning, exploratory analysis, customer analysis, operations analysis, SQL, Tableau dashboards, business insights, and recommendations.

It shows the ability to work with connected tables, clean and validate business data, calculate meaningful KPIs, analyze customer and operational performance, and communicate results through Tableau dashboards.
