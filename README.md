
```
![Python](https://img.shields.io/badge/Python-3.12-blue)
![DBT](https://img.shields.io/badge/dbt-Data%20Transformation-orange)
![Airflow](https://img.shields.io/badge/Airflow-Orchestration-red)
![Snowflake](https://img.shields.io/badge/Snowflake-DataWarehouse-blue)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
```

---

# Airbnb Data Engineering Pipeline

A **modern data engineering pipeline** built using **AWS S3, Snowflake, DBT, Airflow, and Docker** implementing the **Medallion Architecture (Bronze, Silver, Gold)**.

The project demonstrates how raw data can be ingested, transformed, and orchestrated into analytics-ready datasets.

---

# Project Architecture

```
GitHub
   ↓
AWS S3 (Raw Data Storage)
   ↓
Snowflake Stage
   ↓
COPY INTO Staging Tables
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
```

---

# Tech Stack

| Tool           | Purpose                           |
| -------------- | --------------------------------- |
| AWS S3         | Raw data storage                  |
| Snowflake      | Cloud Data Warehouse              |
| DBT            | Data transformation               |
| Apache Airflow | Workflow orchestration            |
| Docker         | Containerized Airflow environment |
| Python         | DAG development                   |
| GitHub         | Version control                   |

---

# Dataset

Airbnb dataset containing:

* Bookings
* Listings
* Hosts

These datasets are used to build a complete **analytics pipeline**.

---

# Data Pipeline Workflow

### Step 1: Data Ingestion

Raw Airbnb CSV files are uploaded into **AWS S3 bucket**.

```
S3 Bucket
 ├── bookings.csv
 ├── listings.csv
 └── hosts.csv
```

---

### Step 2: Load Data into Snowflake

Data is loaded using:

* Storage Integration
* External Stage
* File Format
* COPY INTO command

Snowflake staging tables:

```
AIRBNB.STAGING.BOOKINGS
AIRBNB.STAGING.LISTINGS
AIRBNB.STAGING.HOSTS
```

---

### Step 3: Data Transformation using DBT

DBT transforms raw data into **Medallion Architecture layers**.

### Bronze Layer

Basic ingestion and minimal transformation.

```
bronze_bookings
bronze_listings
bronze_hosts
```

---

### Silver Layer

Cleaned and standardized datasets.

```
silver_bookings
silver_listings
silver_hosts
```

---

### Snapshot Layer

DBT snapshot is used to implement **Slowly Changing Dimension (SCD Type 2)**.

---

### Gold Layer

Final analytical tables.

```
Fact Table
One Big Table (OBT)
Star Schema Dimensions
```

---

# Airflow Orchestration

Apache Airflow orchestrates the DBT pipeline.

DAG Tasks:

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

Airflow ensures tasks execute in the correct order.

---

# Dockerized Airflow Environment

Airflow runs using Docker containers:

```
airflow-apiserver
airflow-scheduler
airflow-worker
airflow-dag-processor
airflow-triggerer
postgres
redis
```

---

# Running the Project

### Clone the repository

```
git clone <repo-link>
```

---

### Start Airflow

```
docker compose up airflow-init
docker compose up -d
```

---

### Access Airflow UI

```
http://localhost:8080
```

Default credentials:

```
username: airflow
password: airflow
```

---

# DBT Commands Used

```
dbt run --select bronze
dbt run --select silver
dbt snapshot
dbt run --select gold
dbt test
```

---

# Final Data Models

Gold layer includes:

* Fact table
* Dimension tables
* One Big Table (OBT)

These tables are optimized for **analytics and BI reporting**.

---

# Future Improvements

* Add Data Quality Checks
* Implement Airflow Sensors
* Integrate CI/CD Pipeline
* Add Monitoring & Alerts
* Build Power BI Dashboard

---

# Author

**Hemangi Vaghasiya**

Aspiring Data Engineer

Skills:

```
Python | SQL | Snowflake | DBT | Airflow | AWS | Docker
```

