# 📊 Project_SQL_Netflix

---

## 📝 Project Objective


The objective of this project is to **practice SQL** by working with Library Management dataset. The goal is to **clean the data, perform CRUD operations, explore the dataset**, and **extract actionable business insights**.

---

## 🧭 Project Workflow

1. **Database Setup:** Create and populate the SQL database.
2. **CRUD Operations:** Apply Create, Read, Update, Delete operations to manage data.
3. **Data Cleaning:** Ensure data consistency and remove invalid entries.
4. **Exploratory Data Analysis (EDA):** Generate questions and explore the dataset.
5. **Insights Delivery:** Extract and present key business insights.

---

## 📂 Project Files

- **Tool Used:** SQL Server Management Studio (SSMS)
- **SQL Script:** `Analysis Queries.sql` 
- **Dataset Link:** Query SQL Server.
- **Format**: `Query`
- **Schema**:
```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```
---

## 🛠️ Database Preparation & Cleaning

### ✅ Setting up the Database

The Netflix dataset was imported into SQL Server Management Studio and formatted using the following operations:


## 🔍 Exploratory Data Analysis (EDA)

The goal of this stage is to explore trends and patterns in the dataset that can lead to actionable insights.


## 🎯 Key Findings

- 💡 **[Insight 1]**: The number of shows vs Movies has been increasing while the movie industry is decreasing from previous numbers.
- 📈 **[Insight 2]**: The closest country to release movies/Tv Shows is India, with less than 2500 releases compared to USA. If you combine the top 5 (excluding USA), you dont even reach the number of releases of USA.
- 🧩 **[Insight 3]**: The longest movie is Black Mirrow with 312 minutes of movie. And the shortest movie is 3 mins long. 

---

## 🧠 Learnings & Challenges

**Learned:**
- How to handle the use CASE to classify information.
- Improved the use of CTEs to prevent long queries.

**Challenges:**
- Using the function cast to prevent ordering information incorrectly.
- Dealing with different formats to evaluate searches.

