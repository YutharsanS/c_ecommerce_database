-- Sales Report
DROP TABLE IF EXISTS sales_report;
CREATE TABLE sales_report (
    year           SMALLINT,
    quarter       SMALLINT CHECK (quarter IN (1, 2, 3, 4)),
    total_sales    INTEGER DEFAULT 0,
    total_earnings NUMERIC (14, 2) DEFAULT 0,
    PRIMARY KEY (year, quarter)
);


