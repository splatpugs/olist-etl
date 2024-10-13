--This script is to initialise the Foreign Key constraints for all the tables.
--Only need to run it once, after the tables has been loaded from Azure Data Factory's pipeline.
--You can run all at once, but make sure to run the delete NULLs from order_reviews table.

--Run this first:
DELETE FROM [dbo].[order_reviews]
WHERE [order_id] IS NULL OR
      [review_score] IS NULL OR
      [review_comment_title] IS NULL OR
      [review_comment_message] IS NULL OR
      [review_answer_timestamp] IS NULL;

--This is ok
ALTER TABLE dbo.customers 
ADD CONSTRAINT fk_customer_zip 
FOREIGN KEY (customer_zip_code_prefix) REFERENCES dbo.geolocation(geolocation_zip_code_prefix);

--This is ok
ALTER TABLE dbo.sellers
ADD CONSTRAINT fk_seller_zip
FOREIGN KEY (seller_zip_code_prefix) REFERENCES dbo.geolocation(geolocation_zip_code_prefix);

--This is ok
ALTER TABLE dbo.orders
ADD CONSTRAINT fk_customer_order
FOREIGN KEY (customer_id) REFERENCES dbo.customers(customer_id);

--This is ok
ALTER TABLE dbo.order_items
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES dbo.orders(order_id);

--This is ok
ALTER TABLE dbo.order_items
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES dbo.products(product_id);

--This is ok
ALTER TABLE dbo.order_items
ADD CONSTRAINT fk_seller
FOREIGN KEY (seller_id) REFERENCES dbo.sellers(seller_id);

--This is ok
ALTER TABLE dbo.order_payments
ADD CONSTRAINT fk_order_payment
FOREIGN KEY (order_id) REFERENCES dbo.orders(order_id);

--This is ok
ALTER TABLE dbo.order_reviews
ADD CONSTRAINT fk_order_review
FOREIGN KEY (order_id) REFERENCES dbo.orders(order_id);

--This is ok
ALTER TABLE dbo.closed_deals
ADD CONSTRAINT fk_mql 
FOREIGN KEY (mql_id) REFERENCES dbo.qualified_leads(mql_id);

 --This is ok
ALTER TABLE dbo.closed_deals
ADD CONSTRAINT fk_seller_closed_deal
FOREIGN KEY (seller_id) REFERENCES dbo.sellers(seller_id);