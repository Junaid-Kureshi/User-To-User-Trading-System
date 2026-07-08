# OLX-Style User-to-User Marketplace — DBMS Project

A relational database project modeling a second-hand, user-to-user trading platform localized for Gujarat, India (Ahmedabad, Surat, Vadodara, Rajkot, Gandhinagar). The project covers schema design, seed data, indexing, and a full analytical query set, plus a CLI console and a web dashboard for interacting with the database.

## Overview

The platform allows guests to browse listings, registered buyers to search, wishlist, message sellers, and leave reviews, and sellers to list and manage products. Admins monitor platform activity, reviews, and disputes.

**Core entities:** Users (Buyer / Seller / Admin), Products, Categories (self-referencing hierarchy), Addresses & Pincode Locations, Wishlists, Conversations & Messages, Reviews, Notifications.

## Project Structure

```
DBMS/
├── 00_database_design.md         # ER analysis, use cases, entity/relationship design
├── 01_ddl_schema.sql             # Table definitions (DDL)
├── 02_insert_data.sql            # Core seed data (Gujarat-focused)
├── 03_indexes.sql                # Performance indexes
├── 04_queries.sql                # Basic → advanced → analytical → admin → edge-case queries
├── 05_additional_insert_data.sql # Extended multi-city seed data
├── backend/                      # Flask REST API
│   ├── app.py
│   └── requirements.txt
├── frontend/                     # Web dashboard (vanilla HTML/CSS/JS)
│   ├── index.html
│   ├── style.css
│   └── app.js
└── TradingSystemConsole/         # Terminal-based console client
    ├── app.py
    └── requirements.txt
```

## Database Design

Full design rationale — user roles, use cases mapped to CRUD operations, entity/relationship breakdown, and the reporting goals behind the query set — is documented in [`00_database_design.md`](./00_database_design.md).

**Key tables:** `User`, `Buyer`, `Seller`, `Admin`, `Contact`, `pincode_location`, `coordinate_pincode`, `address`, `Categories`, `Products`, `Wishlist`, `Contains`, `Product_Image`, `Review`, `Notifications`, `Conversations`, `Message`.

## Query Library

`04_queries.sql` is organized into six tiers:

1. **Basic** — active listings, category/price filters, seller lookup
2. **Intermediate** — city-based search, top-rated sellers, recent listings, wishlists
3. **Advanced** — most active sellers, popular products, multi-seller contact patterns
4. **Complex joins & analytics** — window-function seller rankings, cross-seller price comparison, fraud detection, conversation analytics, city-wise distribution
5. **Admin reports** — seller ranking, feedback trend summaries, listings per category
6. **Edge / interview queries** — second-highest price per category, ghost users, un-wishlisted products, reviewless completed conversations, inactive sellers

## Getting Started

### Prerequisites

- PostgreSQL (a running instance you have credentials for)
- Python 3.10+

### 1. Set up the database

Run the scripts in order against your Postgres instance:

```bash
psql -U <user> -d <database> -f 01_ddl_schema.sql
psql -U <user> -d <database> -f 02_insert_data.sql
psql -U <user> -d <database> -f 03_indexes.sql
psql -U <user> -d <database> -f 05_additional_insert_data.sql
```

Or use one of the two client apps below, which can run setup/insert steps for you.

### 2. Option A — Terminal console

```bash
cd TradingSystemConsole
pip install -r requirements.txt
python app.py
```

Prompts for DB connection details (with defaults shown) and lets you run schema setup, data insertion, and queries from a menu.

### 3. Option B — Web dashboard

Start the API:

```bash
cd backend
pip install -r requirements.txt
python app.py
```

Then open `frontend/index.html` in a browser (served from `http://127.0.0.1:5000` by the API). The dashboard supports:

- **Database Setup** — run schema/data scripts
- **Dashboard** — browse and execute the pre-built query library
- **Data Manager** — inspect table schemas and insert rows via a generated form

## API Reference (backend)

| Method | Endpoint | Purpose |
|---|---|---|
| POST | `/api/setup` | Run DDL schema setup |
| POST | `/api/insert` | Run seed data insertion |
| GET | `/api/queries` | List parsed operational queries |
| POST | `/api/queries/execute` | Execute a query by id |
| POST | `/api/execute_raw` | Execute arbitrary SQL |
| GET | `/api/tables` | List all tables |
| GET | `/api/table/<table_name>/schema` | Get column schema for a table |
| POST | `/api/table/<table_name>` | Insert a row into a table |

## ⚠️ Security Note

`backend/app.py` and `TradingSystemConsole/app.py` currently contain hardcoded database credentials and a host IP for convenience during development. **Before deploying or making this repository public, move these into environment variables** (e.g. via a `.env` file, excluded by `.gitignore`) rather than committing them in source.

## Tech Stack

- **Database:** PostgreSQL
- **Backend:** Flask, Flask-CORS, psycopg2
- **Frontend:** Vanilla HTML/CSS/JS, Lucide icons
- **CLI:** Python, tabulate
