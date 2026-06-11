Creating the table

CREATE TABLE fuel_prices (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    date              DATE,
    country           VARCHAR(100),
    region            VARCHAR(100),
    income_level      VARCHAR(50),
    subsidy_level     VARCHAR(50),
    petrol_usd_liter  DECIMAL(6,3),
    diesel_usd_liter  DECIMAL(6,3),
    lpg_usd_liter     DECIMAL(6,3),
    brent_crude_usd   DECIMAL(6,3),
    tax_percentage    DECIMAL(5,2)
);