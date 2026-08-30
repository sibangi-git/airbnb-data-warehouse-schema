# Airbnb Dimensional Data Warehouse & Relational Schema Design

This repository contains the end-to-end design, dimensional modeling (DM), and SQL implementation of a relational data warehouse for an **Airbnb Online Booking & Review System**. The project demonstrates enterprise-level database architecture, star schema design, Entity-Relationship (ER) modeling, and normalized table structures optimized for Analytical Processing (OLAP) and transactional tracking.

---

## 📌 Repository File Inventory & Architecture

| File Name | File Type | Description & Ph.D. Relevance |
| :--- | :--- | :--- |
| **`Airbnb_DM_Final.mwb`** | MySQL Workbench Model | Visual Data Model (EER Diagram) defining tables, primary/foreign key relationships, and cardinality constraints. |
| **`Airbnb_DM_final.sql`** | SQL Script (DDL) | Complete Data Definition Language (DDL) script for instantiating database schemas, indexes, and constraints in MySQL. |
| **`Airbnb_Dm_table.sql`** | SQL Script | Table-level creation scripts and schema definition modularization. |
| **`Airbnb_mysql_file.sql`** | SQL Script | Sample query scripts, transactional operations, and analytic analytical schema setups. |
| **`docs/data_warehouse_design_report.pdf`** | Technical Report | Architectural documentation detailing business rules, dimensional modeling choices, normalization steps, and schema decisions. |

---

## 🔬 Key Architectural & Database Features

* **Dimensional Modeling (Star Schema):** Designed fact and dimension tables to separate transaction events (bookings, reviews, payments) from reference entities (hosts, listings, guests, locations).
* **Referential Integrity & Constraints:** Implemented strict Foreign Key relationships, primary keys, `ON DELETE` cascading rules, and data validation constraints.
* **Database Normalization:** Applied 3NF principles to analytical lookup tables to minimize redundancy while structuring analytical aggregation queries.

---

## 🛠️ Environment Setup & Database Deployment

### Prerequisites
* MySQL Server 8.0+
* MySQL Workbench (for viewing `.mwb` models)
