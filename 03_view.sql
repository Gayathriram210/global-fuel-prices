create the view:


CREATE VIEW vw_fuel_analysis AS
SELECT 
    id,
    date,
    YEAR(date)                                          AS year,
    MONTH(date)                                         AS month,
    MONTHNAME(date)                                     AS month_name,
    country,
    region,
    income_level,
    subsidy_level,
    petrol_usd_liter,
    diesel_usd_liter,
    lpg_usd_liter,
    brent_crude_usd,
    tax_percentage,
    ROUND(petrol_usd_liter - diesel_usd_liter, 3)      AS petrol_diesel_diff,
    ROUND(petrol_usd_liter / brent_crude_usd * 100, 2) AS petrol_to_brent_ratio
FROM fuel_prices
WHERE petrol_usd_liter IS NOT NULL;