# Tampa Air Travel Operations Analysis

A SQL-first analytics project exploring flight delays, cancellations, and operational performance using U.S. Bureau of Transportation Statistics (BTS) data.

---

## Overview

This project analyzes January 2024 flight data (~547k records) to understand:

- What drives delays and cancellations
- Which carriers, routes, and airports perform best/worst
- Where disruption is concentrated in the network

Built to demonstrate real-world analyst thinking, not just SQL syntax.

---

## Tech Stack

- **PostgreSQL** – data modeling + analysis
- **SQL** – core analysis (aggregations, filtering, KPIs)
- **Tableau** – dashboard (in progress)
- **VS Code + GitHub** – project workflow

---

## Dataset

- Source: BTS On-Time Performance Data
- Scope: January 2024
- ~547,000 flight records
- Key fields:
  - carrier, origin, dest
  - departure delay, arrival delay
  - cancelled, diverted

---

## Project Structure

```
/data
  /raw
  /processed

/sql
  /analysis
    01_explore_raw_data.sql
    02_kpi_overview.sql
    03_carrier_analysis.sql
    04_airport_analysis.sql
    05_route_analysis.sql

  /schema
  /staging
  /transforms

README.md
```

---

## Key Questions

- What is overall flight reliability?
- Which carriers perform best and worst?
- Where (routes/airports) are delays concentrated?
- Do flights recover delays in transit?

---

## Core KPIs

- On-time arrival rate
- Cancellation rate
- Avg departure delay
- Avg arrival delay

**Definition:**

- Delayed = arrival/departure delay > 15 minutes

---

## Key Findings

### 1. Overall Performance is Strong (But Skewed)

- ~76% of flights arrive on time
- ~3.7% are cancelled
- Median arrival delay is early, but averages are positive

Takeaway: A small number of large delays skew overall performance.

---

### 2. Delays Start at Departure

- Avg departure delay: ~15.6 min
- Avg arrival delay: ~10.3 min

Takeaway: Flights often recover time in the air.

---

### 3. Carrier Performance Varies Widely

- Best: Delta (low delays + cancellations)
- Worst: American (highest delays across metrics)
- Outlier: Alaska (major cancellation spike ~17.5%)

---

### 4. Delays Are NOT Evenly Distributed

Performance varies significantly by:

- route
- airport
- carrier

---

### 5. DFW is a Major Bottleneck

Multiple worst-performing routes involve Dallas/Fort Worth (DFW):

- BNA → DFW
- MCI → DFW
- STL → DFW

Takeaway: DFW acts as a network congestion point.

---

### 6. Regional Airports Struggle More

Smaller airports (e.g., MBS, TVC, AVP) show:

- higher delays
- higher cancellation rates

Takeaway: operational variability is higher outside major hubs.

---

### 7. Some Routes Consistently Underperform

Routes like:

- BNA → DFW
- CID → ORD
- BDL → DCA

appear across multiple delay metrics.

Takeaway: these are systemic issues, not random events.

---

### 8. Not All Delays Are Recovered

Example:

- BNA → DFW
  - departure: ~52 min delay
  - arrival: ~55 min delay

Takeaway: some routes worsen in transit due to downstream congestion.

---

## Methodology (Simple + Explainable)

- Start with raw BTS data
- Load into PostgreSQL
- Create clean analysis table (warehouse.flights)
- Build simple, readable SQL queries
- Use:
  - `GROUP BY`
  - `FILTER`
  - `HAVING COUNT(*) > 100` (to avoid small-sample noise)

---

## Why This Project

This project demonstrates:

- ability to structure a real analysis workflow
- strong SQL fundamentals
- business-oriented thinking
- clear, concise insight communication

---

## Next Steps

- Build Tableau dashboard
- Add visual storytelling
- Refine executive summary

---

## TL;DR

Flight performance is generally strong, but delays are:

- concentrated in specific routes and airports
- driven heavily by departure issues
- amplified by bottlenecks like DFW

This is a distribution problem, not a system-wide failure.

---

## Author

Spencer — Data Analyst (Portfolio Project)
