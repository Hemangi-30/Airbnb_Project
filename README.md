---

# 🚀 Airbnb Data Engineering Pipeline

![Python](https://img.shields.io/badge/Python-3.12-blue)
![DBT](https://img.shields.io/badge/dbt-Data%20Transformation-orange)
![Airflow](https://img.shields.io/badge/Airflow-Orchestration-red)
![Snowflake](https://img.shields.io/badge/Snowflake-DataWarehouse-blue)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)

---

# 📌 Project Overview

This project demonstrates a **modern end-to-end data engineering pipeline** built using:

* **AWS S3** for data ingestion
* **Snowflake** as a cloud data warehouse
* **DBT** for transformations
* **Apache Airflow** for orchestration
* **Docker** for containerization

The pipeline follows the **Medallion Architecture (Bronze → Silver → Gold)** to transform raw Airbnb data into **analytics-ready datasets** for business insights.

---

# 🔥 Project Highlights

✔ End-to-End Pipeline (S3 → Snowflake → DBT → Airflow → Power BI)
✔ Implemented Medallion Architecture (Bronze, Silver, Gold)
✔ Built SCD Type 2 using DBT Snapshots
✔ Designed Star Schema for analytics
✔ Automated workflows using Airflow DAGs
✔ Containerized environment using Docker
✔ Built interactive Power BI dashboard

---

# 📊 Architecture

![Architecture](./Archiitecture.png)

---

## 🔍 Architecture Explanation

```
GitHub
   ↓
AWS S3 (Raw Data)
   ↓
Snowflake Stage
   ↓
Staging Tables
   ↓
DBT Bronze Layer
   ↓
DBT Silver Layer
   ↓
DBT Snapshot (SCD Type 2)
   ↓
DBT Gold Layer
   ↓
Airflow Orchestration
   ↓
Power BI Dashboard
```

### Flow Summary:

* Raw CSV data is stored in **S3**
* Loaded into **Snowflake staging tables**
* Transformed using **DBT layers**
* Historical tracking using **Snapshots (SCD Type 2)**
* Orchestrated using **Airflow DAGs**
* Visualized in **Power BI**

---

# ⚙️ Tech Stack

| Tool           | Purpose                   |
| -------------- | ------------------------- |
| AWS S3         | Raw data storage          |
| Snowflake      | Cloud Data Warehouse      |
| DBT            | Data transformation       |
| Apache Airflow | Workflow orchestration    |
| Docker         | Containerized environment |
| Python         | DAG development           |
| GitHub         | Version control           |

---

# 📂 Dataset

Airbnb dataset includes:

* Bookings
* Listings
* Hosts

These datasets are processed to generate **business insights and analytics models**.

---

# 🚀 Data Pipeline Workflow

## 1. Data Ingestion

```
S3 Bucket
 ├── bookings.csv
 ├── listings.csv
 └── hosts.csv
```

---

## 2. Snowflake Loading

* Storage Integration
* External Stage
* File Format
* `COPY INTO` command

Tables:

```
AIRBNB.STAGING.BOOKINGS
AIRBNB.STAGING.LISTINGS
AIRBNB.STAGING.HOSTS
```

---

## 3. DBT Transformation Layers

### 🟤 Bronze Layer (Raw)

* Minimal transformation
* Incremental loading

```
bronze_bookings
bronze_listings
bronze_hosts
```

---

### ⚪ Silver Layer (Cleaned)

* Data cleaning
* Business logic
* Standardization

```
silver_bookings
silver_listings
silver_hosts
```

---

### 🕰️ Snapshot Layer

* Implements **SCD Type 2**
* Tracks historical changes

---

### 🟡 Gold Layer (Analytics Ready)

* Fact Table
* Dimension Tables
* One Big Table (OBT)

---

# 🧱 Data Modeling (Star Schema)

### ⭐ Schema Design

```
Fact Table:
- fact_bookings

Dimension Tables:
- dim_hosts
- dim_listings
- dim_date
```

### 📊 Benefits

* Optimized for BI tools
* Faster query performance
* Easy to understand relationships

---

# 📈 Power BI Dashboard

> ⚠️ Add your screenshot here (VERY IMPORTANT)

```
/images/dashboard.png
```

## 🎯 Key Insights

* Total Revenue & Booking Trends
* Top Performing Hosts
* Location-wise Listings
* Occupancy Analysis
* Seasonal Trends

---

## 📌 Key Visuals

* KPI Cards
* Line Charts (Trends)
* Top N Analysis
* Filters & Slicers
* Interactive Dashboard

---

## 💡 Business Questions Answered

* Who are the top revenue-generating hosts?
* Which locations perform best?
* What are booking trends over time?
* How dependent is revenue on top hosts?

---

# 🔄 Airflow Orchestration

DAG Execution Flow:

```
dbt_bronze
   ↓
dbt_silver
   ↓
dbt_snapshot
   ↓
dbt_gold
   ↓
dbt_test
```

✔ Ensures proper dependency execution
✔ Automates full pipeline

---

# 🐳 Docker Setup

Airflow runs using:

```
airflow-apiserver
airflow-scheduler
airflow-worker
airflow-triggerer
postgres
redis
```

---

# ▶️ Running the Project

### Clone Repo

```
git clone <your-repo-link>
cd <project-folder>
```

---

### Start Airflow

```
docker compose up airflow-init
docker compose up -d
```

---

### Access UI

```
http://localhost:8080
```

```
username: airflow
password: airflow
```

---

# 📌 DBT Commands

```
dbt run --select bronze
dbt run --select silver
dbt snapshot
dbt run --select gold
dbt test
```

---

# 📌 Future Improvements

* Add Data Quality Checks
* Implement Airflow Sensors
* CI/CD Pipeline Integration
* Monitoring & Alerting
* Real-time Data Processing

---

# 👨‍💻 Author

**Hemangi Vaghasiya**
Aspiring Data Engineer

### 💡 Skills

```
Python | SQL | Snowflake | DBT | Airflow | AWS | Docker
```

---
