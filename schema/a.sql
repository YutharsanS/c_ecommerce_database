-- Sale
DROP TABLE IF EXISTS sales_item;
CREATE TABLE sales_item (
    year       SMALLINT,
    quarter    SMALLINT,
    variant_id INT,
    sales      INTEGER DEFAULT 0,
    earnings   NUMERIC (14, 2) DEFAULT 0,
    PRIMARY KEY (year, quarter, variant_id),
    FOREIGN KEY (year, quarter) REFERENCES sales_report (year, quarter) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (variant_id) REFERENCES variant (variant_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);