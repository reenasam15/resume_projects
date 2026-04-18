# Streaming DBT Analytics (DuckDB)

Portfolio-quality dbt Core project modeling a fictional streaming platform end-to-end: from raw CSV inputs to tested, documented marts for product, finance, and marketing analytics.

## Business context
This repository simulates analytics engineering work for a streaming platform with:
- user lifecycle + subscription plan changes
- playback sessions and event-level watch behavior
- ad impressions/clicks and CTR
- payments and churn signals

## Project layout

```text
streaming-dbt-analytics/
  raw_data/               # raw source csv files (ingested by dbt seed into schema raw)
  seeds/                  # helper lookup seeds (schema seed)
  models/
    sources/              # source definitions + docs
    staging/streaming/    # standardized, cleaned source models
    intermediate/         # reusable transformations
    marts/                # final dimensions/facts and analytics marts
  snapshots/              # SCD Type 2 snapshots
  tests/                  # singular business-rule tests
  macros/                 # reusable sql macros
```

## Setup

1. Create environment and install dependencies:
   ```bash
   python -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```

2. Configure profile:
   ```bash
   cp profiles.yml.example ~/.dbt/profiles.yml
   ```

3. Install packages:
   ```bash
   dbt deps
   ```

4. Load CSVs + seed lookup tables:
   ```bash
   dbt seed
   ```

5. Build models and run tests:
   ```bash
   dbt run
   dbt snapshot
   dbt test
   ```

6. Generate docs:
   ```bash
   dbt docs generate
   dbt docs serve
   ```

## Layering strategy
- **Sources**: `raw_streaming` source references seeded raw CSV tables in schema `raw`.
- **Staging**: type casting, status normalization, timestamp cleanup, deduplication.
- **Intermediate**: reusable grains (session event summaries, subscription history, daily activity).
- **Marts**: BI-ready dims/facts and curated marts for engagement, title performance, subscription health, and revenue.

## Notable dbt features demonstrated
- source + model documentation with column-level tests
- generic + singular business-rule tests
- incremental models (`stg_streaming__playback_events`, `fct_watch_activity_daily`)
- SCD Type 2 snapshot (`snap_subscriptions_scd2`)
- reusable macros (`safe_divide`, `generate_surrogate_key`, audit columns)
- exposures for downstream BI dashboards

## Analytics questions answered
- DAU/WAU/MAU trends and watch-time intensity
- title/genre/device engagement patterns
- subscription growth, renewal, and churn behavior
- payment volume and MRR trends by plan
- ad funnel performance and CTR

