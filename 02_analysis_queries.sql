Query 1 — Global average price by year[See how prices changed year by year-including covid dip in 2020]

USE fuel_prices_db;

SELECT
    YEAR(date) AS year,
    ROUND(AVG(petrol_usd_liter), 3) AS avg_petrol,
    ROUND(AVG(diesel_usd_liter), 3) AS avg_diesel,
    ROUND(AVG(brent_crude_usd), 2)  AS avg_brent
FROM fuel_prices
GROUP BY YEAR(date)
ORDER BY year;

Query 2 — Most expensive & cheapest countries (latest data)
sql [Most and least expensive countries right now]

SELECT
    country,
    region,
    ROUND(petrol_usd_liter, 3) AS petrol_price
FROM fuel_prices
WHERE date = (SELECT MAX(date) FROM fuel_prices)
ORDER BY petrol_price DESC
LIMIT 10;

SELECT
    country,
    region,
    ROUND(petrol_usd_liter, 3) AS petrol_price
FROM fuel_prices
WHERE date = (SELECT MAX(date) FROM fuel_prices)
ORDER BY petrol_price ASC
LIMIT 10;


Query 3 — How subsidies affect price
[This directly shows how government subsidies lower fuel costs]

SELECT
    subsidy_level,
    ROUND(AVG(petrol_usd_liter), 3) AS avg_petrol,
    ROUND(AVG(diesel_usd_liter), 3) AS avg_diesel,
    COUNT(DISTINCT country)          AS countries
FROM fuel_prices
GROUP BY subsidy_level
ORDER BY avg_petrol DESC;

Query 4 — Income level vs fuel price [Shows whether richer countries pay more — they usually do because of higher taxes]

SELECT
    income_level,
    ROUND(AVG(petrol_usd_liter), 3) AS avg_petrol,
    ROUND(AVG(tax_percentage), 1)   AS avg_tax_pct,
    COUNT(DISTINCT country)          AS countries
FROM fuel_prices
GROUP BY income_level
ORDER BY avg_petrol DESC;

Query 5 — Regional price comparison [Which regions have the biggest price variation]

SELECT
    region,
    ROUND(MIN(petrol_usd_liter), 3)                            AS min_price,
    ROUND(MAX(petrol_usd_liter), 3)                            AS max_price,
    ROUND(AVG(petrol_usd_liter), 3)                            AS avg_price,
    ROUND(MAX(petrol_usd_liter) - MIN(petrol_usd_liter), 3)   AS price_spread
FROM fuel_prices
GROUP BY region
ORDER BY avg_price DESC;

Query 6 — Brent crude vs petrol correlation [Shows how pump prices follow crude oil prices globally]

SELECT
    YEAR(date)                      AS year,
    ROUND(AVG(brent_crude_usd), 2)  AS avg_brent,
    ROUND(AVG(petrol_usd_liter), 3) AS avg_petrol,
    ROUND(AVG(diesel_usd_liter), 3) AS avg_diesel
FROM fuel_prices
GROUP BY YEAR(date)
ORDER BY year;

