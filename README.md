# 🏠 Nashville Housing Market SQL Analysis

## 📌 Project Overview

This project explores residential property data from **Nashville (2013–2016)** using PostgreSQL. It features 6 clean, well-documented SQL scripts that extract business-critical insights such as market timing, pricing inefficiencies, and property risk.

The objective is to demonstrate **data analysis thinking**, not just technical querying — simulating how a real data analyst would help real estate professionals make smarter decisions.

---

## 🧰 Tools Used
- **PostgreSQL** (via pgAdmin)

- **SQL Views & CTEs** for modular logic
- **Excel** for data inspection and data cleaning
- **Power BI** for data visualizations

---

## 📊 SQL Analyses

### 1. 🧱 Building Age Brackets
**Script:**  [Building_Age_Brackets.sql](/scripts/Building%20Age%20Brackets%20Analysis%20.sql)

Grouped properties by construction year into:
- `Old` (≤ 1950)
- `Mid-Age` (1951–2000)
- `Modern` (> 2000)

🧠 **Business Value:** Helps assess pricing trends based on building age and renovation potential.

---

### 2. 📆 Monthly Sales Trends
**Script:** [Monthly_Sale_Trends.sql](/scripts/Monthly%20Sale%20Trends.sql)

Aggregated total properties sold and average sale price by month using:
- `DATE_TRUNC()`
- Using aggregations like `AVG()`

📈 **Business Value:** Reveals best months to buy/sell; helps marketing & pricing strategy.

---

### 3. ⌛ Property Age vs Price
**Script:** [Property_vs_Age_Pricing.sql](/scripts/Property%20Age%20vs%20Pricing.sql)

Joined property age  with average sale price to determine if newer homes sell at a premium.

📊 **Business Value:** Quantifies the price impact of age for investment/renovation decisions.

---

### 4. 🚩 Suspicious Overpricing
**Script:** [Suspicious_Overpricing.sql](/scripts/Suspicious%20Overpricing.sql)

Flagged homes where:
- `Sale Price` is 100%+ higher than `Total Assessed Value`
- Included `percent_diff` calculation

🕵️ **Business Value:** Exposes overpriced transactions that may suggest inflated markets or poor assessment models.

---

### 5. 🏡 Top Neighborhoods by Avg Sale Price
**Script:** [Top_Neighborhood_Avg_Price.sql](/scripts/Top%20Neighborhoods%20by%20Average%20Sale%20Price.sql)

Ranked neighborhoods by:
- Average sale price
- Total sales volume
- Total revenue

📍 **Business Value:** Guides premium listing strategies and investment targeting.

---

### 6. 🔥 Undervalued Property Detection
**Script:** [Undervalued_Properties.sql](/scripts/Undervalued%20Property%20Analysis.sql)

Used a `CTE` to calculate neighborhood averages, then flagged homes:
- Priced 25%+ below local average
- With size or age advantages

💸 **Business Value:** Supports flipping, rental, or long-term investment decisions.

---

## 🧠 Skills Demonstrated

- Joins, filters, groupings, window functions
- `CTE` for intermediate calculations
- Derived fields and flags using `CASE`
- Reusable views (modular SQL structure)
- Real-world, business-first analytical thinking

---


## 🛠 How I Ran the Project

1. Load the data in Power Query in Excel for data cleaning
2. Set up a PostgreSQL database 
3. Import the cleaned dataset ([Nashville_Housing_Data_Cleaned](/data/Nashville%20Hosing%20Data%20Cleaned.csv))
4. Run scripts in the D beaver and save them `/sql/` folders 
5. Exported the scripts as csv files in Power BI for visualizations


---

## 🙋 About Me

I’m **Doobem**, an aspiring data analyst focused on **SQL-powered business analytics**.  
I love using raw data to tell stories, find opportunities, and solve real-world problems.

📫 [LinkedIn](https://www.linkedin.com/in/prosper-oguzie-54a706336) | [Portfolio](#)

---

## 📜 License

MIT — open to learn, remix, or adapt.
