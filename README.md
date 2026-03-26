#  Airbnb Data Engineering Pipeline

![Python](https://img.shields.io/badge/Python-3.12-blue)
![DBT](https://img.shields.io/badge/dbt-Data%20Transformation-orange)
![Airflow](https://img.shields.io/badge/Airflow-Orchestration-red)
![Snowflake](https://img.shields.io/badge/Snowflake-DataWarehouse-blue)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Visualization-yellow)
![AWS S3](https://img.shields.io/badge/AWS%20S3-Storage-orange)

---

#  Project Overview

A **modern end-to-end data engineering pipeline** using AWS, Snowflake, DBT, Airflow, and Docker.

This project transforms raw Airbnb data into **analytics-ready datasets** using the **Medallion Architecture (Bronze → Silver → Gold)** and delivers **business insights through Power BI dashboards**.

---

#  Project Highlights

✔ End-to-End Pipeline (S3 → Snowflake → DBT → Airflow → Power BI)

✔ Medallion Architecture (Bronze, Silver, Gold)

✔ SCD Type 2 using DBT Snapshots

✔ Star Schema for analytics

✔ Automated Airflow DAG pipeline

✔ Dockerized environment

✔ Business-driven Power BI dashboards

---

#  Architecture

![Architecture](./image/Architecture.png)

---

#  Why This Project Matters

This project simulates a **real-world data engineering system**:

* Building scalable data pipelines
  
* Transforming raw data into analytics-ready models
  
* Automating workflows using Airflow
  
* Enabling business decision-making through dashboards

---

#  Tech Stack

| Tool      | Purpose          |
| --------- | ---------------- |
| AWS S3    | Raw data storage |
| Snowflake | Data warehouse   |
| DBT       | Transformation   |
| Airflow   | Orchestration    |
| Docker    | Containerization |
| Python    | DAG development  |

---

# 📂 Dataset

* Bookings
* Listings
* Hosts
  
* ## 📊 Dataset Summary

| 📁 Table Name | 📊 Number of Records |
|--------------|---------------------|
| Bookings     | 5,000               |
| Listings     | 500                 |
| Hosts        | 200                 |

---

#  Pipeline Workflow

```
S3 → Snowflake → DBT (Bronze → Silver → Gold) → Airflow → Power BI
```

---

# 🧊 Snowflake Data Warehouse

![Snowflake](./image/Snowflake.png)

✔ Data loaded from S3 using COPY INTO

✔ Supports staging, transformation, and analytics layers

---

#  DBT Lineage

![DBT Lineage](./image/DBT%20Lineage.png)

✔ End-to-end transformation flow

✔ Clear model dependencies

---

# Data Modeling (Star Schema)

![Data Model](./image/Data%20Modelling.png)

###  Schema

* Fact Table: `fact_bookings`
* Dimension Tables: `dim_hosts`, `dim_listings`, `dim_date`

✔ Optimized for BI tools

✔ Improves query performance

---

# 📈 Power BI Dashboard

##  Revenue Intelligence Dashboard

![Revenue Dashboard](./image/Revenue%20Dashboard.png)

### 🔍 Insights:

* Revenue trends over time
  
* Top cities contributing to revenue
  
* Property-type revenue distribution

---

## 👤 Host Performance Dashboard

![Host Dashboard](./image/Host%20Dashboard.png)

### 🔍 Insights:

* Top-performing hosts ranking
  
* Host experience vs revenue correlation
  
* Booking distribution per host

---

# 💼 Business Questions Answered

###  Revenue Insights

* What is the total revenue over time?
  
* Which periods generate peak revenue?
  
* Which cities contribute the most revenue?

###  Property Insights

* Which property types generate the most revenue?
* How does property size affect earnings?

### 👤 Host Insights

* Who are the top-performing hosts?
* What is the contribution of top hosts to total revenue?
* How does experience impact performance?

###  Booking Insights

* What are booking trends over time?
* What is the average revenue per booking and per night?

###  Geographic Insights

* Which locations drive business growth?
* Where should expansion be focused?

---

#  Key Metrics Snapshot

* 💰 Total Revenue: ₹6.9M
* 📅 Total Bookings: 5K
* 🌙 Total Nights: 37.43K
* 📈 Avg Revenue per Booking: ₹1.38K
* 🏆 Top Host Contribution: 2%

---

#  Airflow DAG

![Airflow DAG](./image/Airflow%20DAG.png)

✔ Fully automated pipeline

✔ Handles task dependencies

---

#  Docker Setup

```
airflow-apiserver
airflow-scheduler
airflow-worker
postgres
redis
```

---

#  Run Project

```
git clone <your-repo-link>
docker compose up airflow-init
docker compose up -d
```

---

#  DBT Commands

```
dbt run --select bronze
dbt run --select silver
dbt snapshot
dbt run --select gold
dbt test
```

---

#  Key Learnings

* Built an end-to-end data pipeline
* Implemented Medallion Architecture
* Hands-on with DBT transformations and snapshots
* Designed Star Schema for analytics
* Automated workflows using Airflow
* Delivered insights using Power BI

---

# 📌 Future Improvements

* Data Quality Checks
* CI/CD Pipeline Integration
* Monitoring & Alerts
* Real-time data processing

---

# 👨‍💻 Author

**Hemangi Vaghasiya**
Aspiring Data Engineer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/hemangi-vaghasiya-34b645252)
---
