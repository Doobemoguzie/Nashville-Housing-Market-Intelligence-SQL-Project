# 🏠 Nashville Housing Market SQL Case Study  
**Analyzing Pricing Trends, Neighborhood Performance & Investment Opportunities**  

## 📋 Executive Summary

This case study explores housing market data from **Nashville (2013–2016)** to uncover:
- Pricing trends by property age
- Top-performing neighborhoods
- Market timing patterns
- Investment flags (overpriced and undervalued properties)

The project was executed using **Excel** for data cleaning, **PostgreSQL** for data processing and **Power BI** for visualization.  
It simulates real-world decision-making scenarios for real estate investors and analysts.

---

## 🧰 Tools Used
- **Excel**
- **SQL (PostgreSQL via pgAdmin)**
- **Power BI**


---

## 📁 Dataset Overview

| Field Name          | Description                                |
|---------------------|--------------------------------------------|
| `Sale Price`        | Final transaction price of the property    |
| `Sale Date`         | Date of sale                               |
| `Neighborhood`      | Property location                          |
| `Year Built`        | Construction year                          |
| `Finished Area`     | Square footage                             |

📄 File: `Nashville_housing_data_2013_2016.csv`  
📊 Records: ~56,000 rows

---

## 🧼 Data Cleaning Summary

- Converted `Sale Date` to date format using `TO_DATE()`
- Standardized `Sold As Vacant` to Yes/No
- Removed duplicates 
- Filtered out nulls and extreme price outliers


---

## 📊 Analyses & Insights

### 📌 1. Building Age Brackets  
**🧠 Insight:**  
Mid-Age homes dominate the market with 13,365 homes, which is more than 50% of the total but have the lowest average price at $229,610.

However, modern homes command the highest average price at $428,455, despite being the smallest group with only 2,917.

**💼 Business Relevance:**  
Investors that are building can target Modern-style projects. The high price ceiling justifies development costs and yields high returns.

Investors that buy to hold can go for the Mid-Age homes that offer the best price-to-volume ratio. Potential for consistent rental income, especially if grouped.

📄 SQL: [`building_age_brackets.sql`](/scripts/Building%20Age%20Brackets%20Analysis%20.sql)

📊📈Visualization: ![Building Age Visual](/visuals/Building%20Age%20Bucket%20Visual.png)

---

### 📌 2. Monthly Sale Trends  
**🧠 Insight:**  
Highest sales consistently **($821K peak in June 2015)**,
 May-July show sustained high demand with february being weakest sales month (as low as $252K in 2015). January and November also show dips

**💼 Business Relevance:**  
Sellers should capitalize on May-July demand surge, Buyers should Target Q1 **(especially February)** for best deals and Investors should consider Q1 entry points and Q2 exits 

> **Key Takeaway**: Align purchasing with February's low demand and selling with June's peak season for optimal results.

📄 SQL: [`monthly_sale_trends.sql`](/scripts/Monthly%20Sale%20Trends.sql)

📊📈Visualization: ![Monthly Sales Trend](/visuals/Monthly%20Sales%20Trend%20Visual.png)

---

### 📌 3. Property Age vs Pricing  
**🧠 Insight:**  
Property age affects price but not linearly like some very old buildings (e.g., 1832) have extremely high prices ($1.55M), likely due to historic value or prime locations.   
Recent buildings aren't always the most expensive because newer construction (2000s-2010) have spread between $250k snd $500k

**💼 Business Relevance:**  
Older properties generally sell for less, creating a strong opportunity for buy-renovate-sell or affordable rental strategies. Meanwhile, a few historic outliers command premium prices—ideal for niche luxury or commercial conversion plays. The pricing spread shows clear room for targeted, tiered real estate investment models.


📄 SQL: [`property_vs_age_pricing.sql`](/scripts/Property%20Age%20vs%20Pricing.sql)

📊📈Visualization: ![Property Age vs Price Visual](/visuals/Property%20Age%20vs%20Price%20Visual.png)

---

### 📌 4. Suspicious Overpricing Detection  
**🧠 Insight:**  
Overpricing is severe and systematic, Some properties show **overpricing with over 70%** with `percent_diff` values above 60% very common. This is not just rounding error or minor inflation, its **strategic overvaluation** in so many cases 

Overpricing is **not randomly distributed**. Specific `neighborhood` codes appear repeatedly in high `value gap`, This indicates **certain local market are hotbeds for inflated sales -** possibly due to speculative buying and insider deals

Many overprice homes are built **in the 1960s-70s** snd yet sold at new-build prices, This shows **poor correlation between building age and price,** possibly manipulated 

**💼 Business Relevance:**  
This suggest either flawed evaluation method or intentional market manipulation, Investors shouldn't assume high sale price = high quality because overpricing doesn't reflect reality in many cases. A smart investor should **avoid or scrutinize these areas.** 

📄 SQL: [`suspicious_overpricing.sql`](/scripts/Suspicious%20Overpricing.sql)


📊📈Visualization:![Suspicious Overpricing](/visuals/Suspicious%20Overpricing%20Visual.png)

---

### 📌 5. Top Neighborhoods by Avg Sale Price  
**🧠 Insight:**  
Neighborhood `9026`is your top performer, generating **$305M** in revenue from **214 sales**. This suggest a highly **active and reliable market**

Neighborhood `9527` is a **mid-range powerhouse** - $31.9M from 21 sales at $1.52M average. It balances **moderate pricing with consistent demand,** 

Neighborhoods like `4440` and `3221` have **extremely high average prices**($2.98M and $2.78M respectively) but **very few sales.**  

**💼 Business Relevance:**  
Neighborhoods like `4440` and `3221` offer higher **margin per transaction** with fewer operational costs. These neighborhoods are prime for targeted high-end marketing, partnerships with architects/designers and exclusive listings.

Neighborhood `9026` is a business engine that shows consistent buyer activity and market liquidity – perfect for investing in local marketing, or expanding services.

Neighborhoods like `9527` mix decent sale prices ($1.5M) with solid sales volume – makes it easy for steady cash flow and sales forcasting. 


📄 SQL: [`top_neighborhood_avg_price.sql`](/scripts/Top%20Neighborhoods%20by%20Average%20Sale%20Price.sql)

📊📈Visualization:![Top Neighborhoods by Avg Sale Price](/visuals/Top%20Neighborhoods%20by%20Avg%20Sale%20Price%20Visual.png)

---

### 📌 6. Undervalued Property Detection  
**🧠 Insight:**  
**30% of properties (7,267) are underpriced** – These represent immediate investment opportunities and they are priced below their neighborhood average suggesting possible undervaluation or distress 

**Not all neighborhoods offer equal opportunities** – Undervalued properties are not evenly distributed, and certain neighborhoods may consistently have a higher % of underpriced homes which are **priority zones for investors** 

Some properties have a `price_ratio < 0.5`,  meaning they are sold for **less than half** of their neighborhood average price, these are **prime candidates** for deep value buys and distressed sales. 

**💼 Business Relevance:**  
Roughly **1 in 3 properties are selling below market average,** with some deeply discounted at **less than 50% of their neighborhood typical price**. By focusing on these price discrepancies especially in neighborhoods with consistent undervaluation, Investors can systematically target high-ROI opportunities, reduce entry costs and scale acquisitions efficiently.

Investors can also rank neighborhoods by discount frequency and depth, and use this as a **deal filter engine** to stay ahead of retail buyers and competitors

📄 SQL: [`undervalued_properties.sql`](/scripts/Undervalued%20Property%20Analysis.sql)

📊📈Visualization:![Undervalued Properties](/visuals/Undervalued%20Properties%20Visual.png)

---

## 🧠 Key Takeaways

| 💡 Insight | 💼 Why It Matters |
|------------|------------------|
| 🏡 Modern homes are expensive, but mid-aged homes offer best value | Optimizes buy/hold investment strategy |
| 📆 Sales peak in May–July, but prices are lower Jan–Feb | Helps time the market |
| 🔥 80+ homes appear suspiciously overpriced | Risk for banks, investors, or buyers |
| 💡 1 in 3 properties sell below market value | Gives a scalable edge over traditional buyers | 
| 🔥 Neighborhood `9026` is real estate cash cow | It has highest sales, brings in the most revenue and a solid mid-range price |

---

## 🛠️ Skills Demonstrated

- Advanced SQL queries with CTE, CASE, and aggregations
- Data cleaning in Excel
- Insightful metrics design
- Real estate logic simulation
- Dashboard design and storytelling with Power BI

---

## 🔗 Contact

**Author:** Doobem  
📧 prosperoguzie379@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/prosper-oguzie-54a706336)  
📂 [Project Dashboard](/visuals/Nashville%20Housing%20Market%20SQL%20Analysis%20Full%20Visuals.pbix) | [Live GitHub Repo](#)

---

## ✅ How to Use This Repo

1. Clone the repo  
2. Open SQL scripts in pgAdmin or your preferred SQL editor  
3. Load dataset into PostgreSQL  
4. Run scripts in order, or individually for insight  
5. Open Power BI `.pbix` file to explore visuals

---

## 📎 License

This project is open for educational use. Attribution appreciated.