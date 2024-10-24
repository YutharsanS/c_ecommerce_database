DELIMITER //

DELIMITER //

CREATE PROCEDURE quarterly_sales_report(IN st TIMESTAMP, IN en TIMESTAMP, IN qt SMALLINT)
BEGIN
    DECLARE tot_sales INT DEFAULT 0;
    DECLARE tot_earnings DECIMAL(14, 2) DEFAULT 0;

    -- Insert the year and quarter into the sales_report table
    INSERT INTO sales_report (year, quarter)
    VALUES (YEAR(st), qt);

    -- Insert aggregated sales and earnings data into the sales_item table
    INSERT INTO sales_item (year, quarter, variant_id, sales, earnings)
        SELECT 
            YEAR(st), 
            qt, 
            oi.variant_id, 
            SUM(oi.quantity) AS sales, 
            SUM(oi.quantity * v.price) AS earnings  -- Multiply quantity by variant price
        FROM orders AS o
        LEFT JOIN order_items AS oi ON o.order_id = oi.order_id
        LEFT JOIN variant AS v ON oi.variant_id = v.variant_id  -- Join with variant table to get price
        WHERE o.order_date BETWEEN st AND en  -- Use o.order_date instead of o.date
        GROUP BY oi.variant_id;

    -- Calculate total sales and earnings
    SELECT SUM(sales), SUM(earnings) INTO tot_sales, tot_earnings
    FROM sales_item
    WHERE year = YEAR(st) AND quarter = qt;

    -- Update the sales_report table with the calculated total sales and earnings
    UPDATE sales_report
    SET total_sales = tot_sales, total_earnings = tot_earnings
    WHERE year = YEAR(st) AND quarter = qt;

END //

DELIMITER ;
  drop procedure quarterly_sales_report;


  CALL quarterly_sales_report('2022-02-01 00:00:00', '2022-05-31 23:59:59', 3);

 
