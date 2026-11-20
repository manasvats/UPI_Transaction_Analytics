# UPI Transaction Intelligence
### Payment Performance | Customer Behaviour | Failure Analysis

## Project Overview

UPI Transaction Intelligence is a data analytics project designed to analyze UPI payment transactions, identify transaction failure patterns, evaluate bank and payment app performance, and understand customer and merchant transaction behaviour.

The project uses Python, SQL Server and Power BI to transform raw transaction data into meaningful business insights through data analysis and interactive dashboards.

**Important:** This project uses a synthetically generated dataset for educational and portfolio purposes. It does not contain real customer or banking transaction records.

## Business Objectives

- Analyze overall UPI transaction performance.
- Measure successful, failed and pending transaction rates.
- Identify major reasons behind payment failures.
- Compare payment app and bank performance.
- Analyze transaction trends by month and hour.
- Understand city-wise and merchant-category transaction patterns.
- Compare P2P and P2M transactions.
- Evaluate transaction processing time and customer activity.

## Technology Stack

| Technology | Purpose |
|---|---|
| Python | Dataset generation and data processing |
| Pandas & NumPy | Data manipulation and analysis |
| SQL Server | Data storage and SQL analytics |
| Power BI | Interactive dashboards and visualization |
| DAX | KPI calculations and measures |
| VS Code | Development environment |

## Dataset Information

The project contains 100,000 synthetically generated UPI transaction records with 15 columns.

Key fields include:

- Transaction ID
- Customer ID
- Transaction Amount
- Payment App
- Sender Bank
- Receiver Bank
- Transaction Status
- Transaction Date
- Transaction Hour
- Failure Reason
- Processing Time
- City
- Merchant ID
- Merchant Category
- Transaction Type

Transaction statuses: SUCCESS, FAILED and PENDING.

Transaction types: P2P and P2M.

## Project Workflow

1. Generated a synthetic UPI transaction dataset using Python.
2. Performed data quality checks and validation.
3. Imported transaction data into SQL Server.
4. Conducted SQL-based business analysis.
5. Created DAX measures in Power BI.
6. Developed a five-page interactive dashboard.
7. Documented business findings and observations.

## Power BI Dashboard Pages

### 1. Executive Overview
Overall transaction performance, KPIs, monthly trends, payment app distribution and city-wise transaction volume.

### 2. Payment Failure Analysis
Failure reasons, sender bank failures, payment app failure rates and hourly failure trends.

### 3. Customer Behaviour Analysis
Customer activity, repeat transactions, failed customer transactions and P2P/P2M comparisons.

### 4. Bank & Payment App Performance
Sender and receiver bank comparisons, bank failure rates, payment app performance and successful transaction values.

### 5. Transaction Trends & Merchant Analysis
Monthly transaction trends, hourly activity, merchant category performance, city-wise volume and P2P/P2M success rates.

### Interactive Filters

The dashboard includes four slicers:

- Payment App
- Transaction Date Range
- City
- Transaction Type

These filters are synchronized across all five dashboard pages.

## Key Business Findings

- Total transactions: 100,000.
- Successful transactions: 84,955.
- Failed transactions: 10,036.
- Pending transactions: 5,009.
- Overall success rate: 84.96%.
- Overall failure rate: 10.04%.
- Successful transaction value: ₹217,043,922.
- Average processing time: 5,235.13 milliseconds.
- Bank Server Error was the most frequent failure reason.
- July recorded the highest monthly transaction volume.
- Bareilly recorded the highest city-wise transaction volume.

For detailed findings, refer to `reports/UPI_Business_Insights.md`.

## Project Structure

```text
UPI_Transaction_Analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── python/
│
├── sql/
│
├── powerbi/
│   └── UPI_Transaction_Analytics.pbix
│
├── reports/
│   └── UPI_Business_Insights.md
│
├── docs/
│
└── README.md
```

## Tools & Skills Demonstrated

- Python programming
- Data cleaning and validation
- SQL querying and aggregation
- Business data analysis
- DAX measures
- Power BI dashboard development
- KPI tracking
- Data visualization
- Business insight generation

## Limitations

- The dataset is synthetic and does not represent actual UPI industry performance.
- Customer repeat activity is influenced by the data generation design.
- Failed and pending transaction amounts represent attempted payment values, not confirmed financial losses.
- The analysis does not establish causal relationships.

## Future Improvements

- Integrate real or publicly available anonymized payment datasets.
- Add advanced customer segmentation.
- Develop predictive models for transaction failure analysis.
- Implement more detailed time-based trend analysis.
- Explore payment failure anomaly detection.

## Author

**Manas Vats**

B.Tech – Computer Science & Engineering

Interested in Data Analytics, Business Intelligence and Fintech Analytics.