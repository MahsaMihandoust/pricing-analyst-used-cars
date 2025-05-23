# Pricing-Analyst-Used-Cars
Pricing Analyst with Used Cars Dataset — Market Analysis, Modeling, and Dashboard


## 📝 Project Overview
This project simulates the role of a Pricing Analyst by analyzing market trends, evaluating vehicle values, and developing pricing strategies for used cars to optimize profitability and competitiveness.

## 🎯 Business Objective
- Analyze used car market data to understand pricing trends.
- Develop predictive models to estimate optimal vehicle pricing.
- Build interactive dashboards for pricing insights.

## 🗂️ Project Structure
- **data/**: [Kaggle Used Cars Dataset](https://www.kaggle.com/datasets/austinreese/craigslist-carstrucks-data/data)
- **notebooks/**: Google Colab for EDA, modeling, and visualization.
- **sql/**: SQL scripts for data manipulation.
- **reports/**: Final presentations and executive summaries.
- **visuals/**: Power BI dashboards and key visualizations.
- **models/**: Saved machine learning models and evaluation.
- **scripts/**: Python scripts for data processing and modeling pipelines.

## 🛠️ Tools & Technologies
- Python (Pandas, NumPy, Scikit-learn, Statsmodels)
- SQL (SQLite for simulation)
- Power BI (Dashboards & Reporting)
- Excel (Initial pricing calculations)
- Jupyter Notebook (EDA & Modeling)

## 🔄 Process & Methodology

This project followed a structured, end-to-end data science workflow:

---

#### 📥 Stage 1: Data Acquisition
- Used the **Craigslist Cars & Trucks** dataset from [Kaggle](https://www.kaggle.com/datasets/austinreese/craigslist-carstrucks-data).
- Downloaded and extracted data directly in **Google Colab** using the Kaggle API.

---

#### 🧹 Stage 2: Data Cleaning & Preparation

The raw dataset contained over **426,000 used vehicle listings** with a number of missing and inconsistent values. To prepare the data for analysis and modeling, the following steps were performed:

#### 🔍 Missing Value Handling
- Dropped rows with missing values in **critical columns**: `price`, `year`, and `odometer`
- Filled missing values in **categorical columns** such as `condition`, `fuel`, `cylinders`, `transmission`, `paint_color`, etc., with `'unknown'`

#### ⚠️ Outlier Removal (Price & Odometer)
Outliers were identified using **boxplots** and **percentile analysis**:

- **Price Filtering**:
  - Most cars fall within the range of **$1,500 to $75,000**
  - Outliers were removed by filtering out prices **below $1,000** or **above $100,000**
  - Thresholds were chosen based on `.describe()` and `.quantile()` statistics

- **Odometer Filtering**:
  - Realistic odometer range was defined as **1,000 to 300,000 miles**
  - Extreme values (e.g., **5 miles** or **1,000,000 miles**) were excluded
  - Boxplots showed most listings clustered under **250,000 miles**

#### 🧠 Feature Engineering
The following new features were created to support modeling and analysis:
- `vehicle_age` = current year − vehicle year
- `price_per_mile` = price ÷ odometer
- `is_clean_title` = 1 if `title_status` contains the word `'clean'`, else 0

---

#### 📊 Stage 3: Exploratory Data Analysis (EDA)
- Visualized key trends using **histograms, boxplots, and groupby summaries**.
- Explored pricing patterns by **manufacturer, vehicle age, and condition**.

---

#### 🤖 Stage 4: Modeling & Forecasting
- Built regression models using **Scikit-learn** and **Statsmodels** to predict vehicle prices.
- Evaluated model performance using metrics like **RMSE**, **MAE**, and **R²**.

---

#### 📈 Stage 5: Visualization & Dashboard
- Created interactive dashboards in **Power BI** showing:
  - Average price by **vehicle type and age**
  - Inventory composition by **region and condition**
  - Forecasted vs. actual prices

---

#### 📝 Stage 6: Reporting
- Summarized insights in **executive-ready presentation slides**.
- Uploaded key assets to GitHub:
  - Colab notebooks
  - SQL queries
  - Cleaned datasets
  - Power BI dashboards


## 📊 Key Deliverables
- Market Analysis Report
- Pricing Forecasting Model
- Interactive Power BI Dashboard
- Business Insights & Recommendations

## 📎 Project Links
- [Power BI Dashboard](#link)
- [Full Project Repository](#this-repo)

## 👤 Author
- Mahsa Mihandoust | [LinkedIn](https://www.linkedin.com/in/your-profile)


