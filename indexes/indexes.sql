CREATE INDEX index_product_product_name ON product(product_name);

DROP INDEX index_product_product_name ON product;

CREATE INDEX index_property_price_increment ON variant(price);


-- doubt
CREATE INDEX index_sales_item_year_quarter ON sales_item(year, quarter);

CREATE INDEX Index_Customer_Id ON cart(customer_id);