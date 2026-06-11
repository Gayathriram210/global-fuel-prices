## Global Fuel Prices Analysis (SQL + Power BI)

## Overview
Analysis of 27,470 records across 84 countries and 7 regions 
spanning 2020-2026, exploring fuel price trends, regional 
disparities, subsidy impacts, and income level correlations.

## Key Insights
- Countries with Very High subsidies pay 23x less than Low subsidy countries ($0.15 vs $3.45)
- High income countries pay $3.55/liter vs $1.39 for Low income countries
- Europe is the most expensive region at $3.70 avg, Middle East cheapest at $1.23
- Petrol prices nearly doubled from 2020 ($1.49) to 2026 ($2.65) post-COVID

## Tools Used
- MySQL data storage, cleaning, and analysis
- Power BI interactive dashboard

## Dashboard Preview
![Dashboard](screenshots/dashboard.png)

## Dataset
- 27,470 rows | 84 countries | 7 regions | 2020-2026
- Columns: date, country, region, income_level, subsidy_level,
  petrol_usd_liter, diesel_usd_liter, lpg_usd_liter, 
  brent_crude_usd, tax_percentage
