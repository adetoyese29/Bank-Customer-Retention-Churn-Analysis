# 🏦 Bank Customer Retention & Churn Analysis

https://app.powerbi.com/view?r=eyJrIjoiNjlkMjQ1N2ItMWUwNy00ZWQyLWI4ZTctZDRkNmI5NTk4NDQxIiwidCI6IjM5ZTBjZjljLTBiZTktNGFkNS1hOWIwLTEwZGE2Y2QzYzlkMiJ9
*Interact with the power bi dashboard here.*

## 📄 Executive Summary

This project analyzes the behavior of 10,000 bank customers to identify the root causes of customer churn.

**Key Result:** The bank has a critical "Revenue Bleed" problem. While the overall churn rate is **20%**, the churn rate for high-net-worth customers in Germany is **32%**. Furthermore, the bank's cross-selling strategy is backfiring: **100% of customers with 4 products have churned**, indicating a "toxic" product bundle that forces users to leave.

## ❓ Business Problem

The bank is struggling with a high churn rate (20%) and needs to understand:
1.  **Who is leaving?**
2.  **Where is the money going?**
3.  **Why are they leaving?**

## 📂 Data Source

* **Source:** [Kaggle: Bank Customer Churn Prediction](https://www.kaggle.com/datasets/shantanudhakadd/bank-customer-churn-prediction)
* **Volume:** 10,000 rows.
* **Key Features:** `CreditScore`, `Geography`, `Gender`, `Age`, `Tenure`, `Balance`, `NumOfProducts`, `HasCrCard`, `IsActiveMember`, `EstimatedSalary`, `Exited` (Churn Flag).

## 🛠️ Tech Stack

* **SQL (PostgreSQL):** Data cleaning, "bucketing" logic (Age Groups, Credit Score ranges), and validation of key insights.
* **Power BI:** Interactive dashboard design, DAX measures for "Capital at Risk," and advanced visualizations (Scatter Plots & Combo Charts).
* **Excel:** Initial data exploration.

---

## ⚙️ Methodology

### 1. Data Cleaning & Transformation (SQL)
Instead of loading raw data into Power BI, I used SQL to create a clean analytical layer.
* **Logic Implemented:** Created a custom view `analytics_churn_data` that grouped continuous variables (Age, Credit Score) into categorical "buckets" for clearer analysis.
* **Validation:** Verified the "100% Churn" anomaly for 4-product users to ensure statistical significance (n > 50) before reporting it.

### 2. Visualization Strategy (Power BI)
* **Scatter Plot Analysis:** Used to correlate `Churn Rate` vs. `Average Balance` by Geography, identifying Germany as a "High Risk / High Value" quadrant.
* **Line & Column Combo Chart:** Visualized the "Mid-Life Churn Crisis" (Age 45-60) where churn spikes despite customer maturity.

---

## 📊 Key Insights

### 1. The "Toxic Bundle" (Product Strategy Failure)
* **The Finding:** Customers with 1 or 2 products have a healthy churn rate (~10%). However, churn spikes to **83% for 3 products** and **100% for 4 products**.
* **The Implication:** The bank's cross-selling strategy is failing. The 3rd and 4th products (likely investments or secondary accounts) create friction or offer poor value, driving customers away immediately.

### 2. The "German Wealth Bleed"
* **The Finding:** While Germany accounts for 25% of customers, it represents a disproportionate share of **Capital at Risk** due to high average balances.
* **The Implication:** German customers are 2x more likely to churn (32%) than French or Spanish customers (16%). The bank is losing its "Whale" clients.

### 3. The "Mid-Life Crisis"
* **The Finding:** Contrary to the expectation that young people are volatile, the highest churn rates are found in the **45–60 Age Bracket** (Retirement Planning age).
* **The Implication:** Competitors are likely poaching mature clients with better wealth management or pension products.

---

## 🚀 Recommendations

### 1. Stop the "Toxic Bundle" (Immediate Action)
* **Halt Marketing:** Immediately stop marketing campaigns pushing the 4th product. It guarantees customer loss.
* **Pivot Strategy:** Refocus sales KPIs to target the "Sweet Spot" of **2 Products per customer**, where retention is highest.

### 2. Launch "VIP Germany" Retention Program
* **Targeting:** Focus retention efforts specifically on German account holders with balances > €100k.
* **Action:** Assign dedicated Relationship Managers to this segment to prevent high-value capital flight.

### 3. Competitor Analysis for the 45-60 Demographic
* **Action:** Investigate competitor offers for retirement/pension planning. Offer a free "Financial Health Check" to customers turning 45 to lock them in for the long term.
