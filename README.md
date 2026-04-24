# 🏦 Retail Banking Analytics System (SQL + BI Dashboard)

## 📌 Project Overview  
An end-to-end banking analytics system built using SQL and Google Looker Studio to analyze retail banking transactions, customer behavior, fraud patterns, and revenue performance.  

The project simulates real-world financial analytics workflows to support data-driven decision-making in banking operations.

---

## 🎯 Objective  
To extract actionable insights from banking transaction data by analyzing:  
- Customer spending behavior  
- Fraud patterns across transactions  
- Revenue performance metrics  
- Customer value segmentation  

---

## 🛠️ Tools & Technologies  
- SQL (Data extraction, transformation, analysis)  
- MySQL  
- Google Looker Studio (Dashboard & Visualization)  
- Spreadsheet / CSV (Data handling & preprocessing)  

---

## 📊 Dataset Overview  
- Total Records (SQL Analysis): 15,104 rows  
- Total Records (Dashboard Optimized View): 6,000 rows  
- Total Revenue: ₹297,019,836.06  
- Average Transaction Value: ₹49,503.31  
- Fraud Rate: 4.98%  

📌 Note: Full dataset was used for SQL-based analysis. A sampled subset was used in Looker Studio to optimize dashboard performance while preserving data distribution consistency.

---

## 🔍 Key Analysis Performed  

### Customer & Revenue Analysis  
- Total transactions and revenue computation  
- Identification of top-spending customers  
- Average transaction value per customer  

### Fraud Analysis  
- Fraud vs non-fraud transaction distribution  
- Fraud rate calculation  
- Fraud patterns by merchant category and transaction type  

### Customer Segmentation  
- Segmented customers into High, Medium, and Low value groups  
- Analyzed revenue contribution by each segment  

### Time-Based Analysis  
- Monthly transaction trends  
- Dataset limitation: data concentrated in a single time period  

---

## 📈 Key Insights  
- Small group of customers contributes majority of revenue (Pareto pattern)  
- Fraud is concentrated in categories such as Health, Groceries, and Restaurants  
- Bill Payments and Withdrawals show higher fraud risk  
- Customer segmentation enables targeted banking strategies  

---

## 📊 Dashboard Features (Looker Studio)  
- KPI dashboard: Revenue, Transactions, Fraud Rate  
- Fraud analysis by merchant category  
- Fraud distribution by transaction type  
- Customer segmentation visualization  
- Interactive filters (City, Transaction Type)  

---

## 📷 Dashboard Preview

<img width="821" height="613" alt="dashboard_overview" src="https://github.com/user-attachments/assets/97cc4f0a-93a9-4bcf-9885-927371629337" />

---

## 🎯 Business Impact  
- Identifies high-risk fraud categories for improved monitoring  
- Enables customer value-based targeting strategies  
- Supports revenue and transaction performance tracking  
- Improves decision-making through visual analytics  

---

## 🧠 Key Skills Demonstrated  
- SQL Data Analysis & Query Optimization  
- Business Intelligence Dashboarding  
- Fraud Pattern Analysis  
- Customer Segmentation  
- KPI Design & Data Storytelling  
- Google Looker Studio  

---

## 📁 Project Structure  

Retail-Banking-Analytics-System/  
│  
├── SQL_Analysis.sql  
├── Looker_Dashboard.pdf   
└── README.md  

---

## 🚀 Future Enhancements  
- Time-series fraud trend analysis  
- Geo-location based fraud heatmaps  
- Predictive fraud detection using ML  
- Automated reporting dashboard system  
