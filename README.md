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


To identify price drivers and guide modeling, detailed exploration was performed on 365,205 cleaned used vehicle listings from 42 unique manufacturers, spanning model years 1900 to 2022.

#### 🔍 Distribution Analysis
- **Price**: Most listings are between $5,000 and $30,000, peaking around $10,000.
- **Odometer**: Mileage typically ranges from 10,000 to 250,000 miles.
- **Vehicle Age**: Clear downward trend in price with increasing vehicle age.

![Price Histogram](./visuals/price_histogram.JPG)
![Odometer Histogram](./visuals/odometer_histogram.JPG)

#### 📉 Relationship Insights
- **Price vs. Age**: Shows depreciation as vehicles get older.
- **Condition & Price**:
  - "New", "Good", and "Like New" vehicles had the highest average prices.
- **Top Manufacturers**:
  - Premium brands like Ferrari and Tesla had the highest average prices.
  - Mass-market brands like Ford, Toyota, and Honda were priced mid-range.

![Price vs. Vehicle Age](./visuals/Price_vs_Vehicle_Age.JPG)
![Price by Condition](./visuals/Average_Price_by_Condition.JPG)
![Top 10 Manufacturer Boxplot](./visuals/Average_Price_by_Top_10_Manufacturers.JPG)

#### 📊 Summary Tables
- **By Condition**: Prices ranged from ~$4,200 (Fair) to ~$23,000 (New).
- **By Manufacturer**: Ferrari ($74k), Tesla ($40k), Ram ($31k).
- **By Year**: Newer vehicles (2020–2022) priced >$35,000 on average.

![Summary: Condition](./visuals/Average_Price_by_Condition.JPG)
![Summary: Manufacturer](./visuals/Average_Price_by_Manufacturer.JPG)
![Summary: Year](./visuals/Average_Price_by_Vehicle_Year.JPG)

#### 🔗 Correlation Insights
- Strong negative correlation between price and both odometer (-0.56) and vehicle age (-0.39)
- Moderate positive correlation between price and price-per-mile (0.41)

![Correlation Matrix](./visuals/Correlation_Matrix.JPG)

---

#### 🤖 Stage 4: Modeling & Forecasting

To predict vehicle prices and support data-driven pricing strategies, multiple regression models were developed and evaluated. The models used a log-transformed target variable (`price`) and included both numeric and encoded categorical features.

#### 🧠 Model Improvements

To enhance prediction accuracy, the following steps were taken:

- ✅ Applied **log transformation** to the target variable (`price`) to reduce skewness
- ✅ Used **one-hot encoding** for categorical features: `manufacturer`, `condition`, and `transmission`
- ✅ Included both **linear** and **tree-based models** to compare interpretability vs. performance
- ✅ Evaluated **six models** to determine the best fit for forecasting:

#### 🧪 Models Evaluated

- Linear Regression
- Ridge Regression
- Lasso Regression
- Random Forest Regressor
- XGBoost Regressor
- Gradient Boosting Regressor

#### 📊 Evaluation Metrics

| Model               | RMSE       | MAE        | R²     |
|--------------------|------------|------------|--------|
| Linear Regression  | $9,998.44  | $6,638.35  | 0.4943 |
| Ridge Regression   | $11,196.84 | $7,563.75  | 0.3658 |
| **Random Forest**  | **$6,128.34** | **$2,942.84** | **0.8100** |
| XGBoost            | $8,837.25  | $5,721.34  | 0.6049 |
| Gradient Boosting  | $9,346.74  | $6,066.01  | 0.5581 |

📸 _Screenshot: Model evaluation summary table_

#### 🔍 Feature Importance (Random Forest)

The Random Forest model identified the following most influential features in predicting used car prices:

📸 _Screenshot: Top 15 Feature Importances Bar Chart_

#### 📈 Predicted vs. Actual Prices

The scatterplot below visualizes how well the Random Forest model approximated actual vehicle prices:

📸 _Screenshot: Predicted vs Actual Price Scatterplot_

#### ✅ Conclusion

- The **Random Forest Regressor** delivered the best performance, significantly outperforming linear models.
- It explained over **81% of the variance** in price and had the lowest prediction error.
- This model will power the pricing simulations in Stage 5: Pricing Strategy Development.


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


