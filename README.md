
# 🚀 Data Engineering & Analytics Pipeline with Snowflake and dbt

Welcome to the **Data Engineering & Analytics Project** repository!

This project showcases an end-to-end modern data pipeline—from raw data ingestion to structured data modeling and analytics—leveraging the power of **Snowflake** as a cloud data warehouse and **dbt (Data Build Tool)** for transformation and modeling. It’s designed to demonstrate industry-grade practices in data engineering, warehouse architecture, and analytics modeling.

---
## 👨‍💻 About My Contribution
This repository is a fork of [dbt_analytics](https://github.com/Davshegs/dbt_analytics), where i contributed to the project as a team member

### ✅ My Roles include
* Built the Product model
* Performed data transformation according to business rules
* Testing and configurations in the yml files
* Contributed to generating surrogate keys for creating relationship with the Fact table
* Contributed to building Star schema model and
* Testing for referential integrity
---
## 🏗️ Data Architecture

The data warehouse is designed using the **Star Schema** modeling technique and follows a layered architecture inspired by dbt best practices:

```
📦 Staging Layer   →   🧹 Transformation Layer   →   📊 Mart Layer (Star Schema)
```

### Layers Explained:
1. **Staging Layer**: Contains raw ingested tables. Acts as the foundation for all transformations. Mirrors the original datasets.
2. **Transformation Layer**: Cleansed, standardized, and enriched data prepared for analysis.
3. **Mart Layer**: Final analytical models—**fact** and **dimension** tables—optimized for reporting and business intelligence.

This architecture ensures **modularity**, **scalability**, and **clear lineage** from raw to analytics-ready data.

---

## 📖 Project Overview

### ✅ Key Components:
- **Data Ingestion**: Raw datasets are uploaded into **Snowflake** using secure stage ingestion or manual upload.
- **Data Modeling**: Using **dbt**, models are organized into:
  - **staging**: Raw tables cleaned and aliased.
  - **transform**: Business logic applied (joins, filters, type conversions).
  - **mart**: Star schema with fact and dimension tables.
- **Packages Used**:
  - [dbt-utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/)
  - [codegen](https://hub.getdbt.com/dbt-labs/codegen/latest/)
- **Analytics**: SQL-based reports built on top of fact tables for insights such as customer behavior, sales performance, and product analytics.

---

## 🧰 Tech Stack & Tools

| Category          | Tools / Tech                                |
|------------------|---------------------------------------------|
| Data Warehouse    | [Snowflake](https://www.snowflake.com/)     |
| Modeling & ETL    | [dbt](https://www.getdbt.com/)              |
| Orchestration     | Manual / dbt Cloud (optional)               |
| Version Control   | [Git](https://git-scm.com/)                 |
| Diagramming       | [Draw.io](https://www.drawio.com/)          |

---

## 📂 Repository Structure

```
data-pipeline-snowflake/
│
├── models/
│   ├── staging/              # Raw data cleaned and renamed
│   ├── transform/            # Business logic transformations
│   └── mart/                 # Final star schema (fact + dimension)
│
├── data/                     # Raw data (CSV files)
│
├── docs/                     # Project diagrams and metadata
│   ├── schema_design.drawio
│   ├── dbt_data_flow.png
│   └── data_catalog.md
│
├── snapshots/                # Optional snapshots for slowly changing dimensions
│
├── tests/                    # dbt tests (e.g., uniqueness, not_null)
│
├── dbt_project.yml           # Main dbt project config
├── packages.yml              # dbt packages config
├── README.md                 # Project overview
└── .gitignore
```

---

## 📊 Sample Insights Delivered

Some example business questions answered with the transformed data:

- Which products contribute the most to total sales?
- What is the average purchase frequency by customer segments?
- Which regions show declining trends in sales over time?

---

## 💡 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/davshegs/dbt_analytics.git
   ```

2. Install dbt dependencies:
   ```bash
   dbt deps
   ```

3. Configure your `profiles` to connect dbt with your Snowflake instance.

4. Run the pipeline:
   ```bash
   dbt run
   ```

5. (Optional) Generate documentation:
   ```bash
   dbt docs generate && dbt docs serve
   ```

---

## 🎯 Learning Objectives

This project is ideal for those aiming to build hands-on expertise in:

- Cloud Data Warehousing (Snowflake)
- Modern Data Stack (dbt, modular SQL)
- Data Modeling (Star Schema, Fact-Dimension Tables)
- Scalable ETL Pipelines
- Analytical Thinking & SQL Optimization

---

## 👨‍💻 About Us

Hi, we're **Shegun David** and **Immaculate Okoro**, a passionate duo of data professionals with a shared interest in building reliable, scalable, and insightful data solutions.

We collaborated on this project to showcase the practical application of data engineering principles using modern tools like **Snowflake** and **dbt**. Our goal is to demonstrate how clean architecture, thoughtful modeling, and modular transformation can deliver real business value.

Let’s connect:

**Shegun David**  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/david-shegun-6a42aa29b)  
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/davshegs)

**Immaculate Okoro**  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/immaculate-okoro)  
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/immaculate-okoro)

---

## 🙌 Credits

- **Shegun David** – Lead Data Engineer, dbt Implementation, Architecture Design
- **Immaculate Okoro** – Data Pipeline Collaborator, Testing, and Validation

This was a joint learning and development effort and reflects a shared commitment to clean data and modern engineering practices.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE). Free to use, share, and adapt with proper credit.
