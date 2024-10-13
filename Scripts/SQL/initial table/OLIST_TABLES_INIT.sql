CREATE TABLE geolocation (
    geolocation_zip_code_prefix INTEGER PRIMARY KEY, -- Primary Key of BIGINT Type
    geolocation_lat FLOAT, -- Latitude as double equivalent
    geolocation_lng FLOAT, -- Longitude as double equivalent
    geolocation_city VARCHAR(8000), -- City
    geolocation_state VARCHAR(8000) -- State
);

CREATE TABLE customers (
    customer_id NVARCHAR(450) PRIMARY KEY,
    customer_unique_id VARCHAR(8000),
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(8000),
    customer_state VARCHAR(8000),
    --CONSTRAINT fk_customer_zip FOREIGN KEY (customer_zip_code_prefix) REFERENCES geolocation(geolocation_zip_code_prefix) -- Foreign Key
);

CREATE TABLE sellers (
    seller_id NVARCHAR(450) PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR(8000),
    seller_state VARCHAR(8000),
    --CONSTRAINT fk_seller_zip FOREIGN KEY (seller_zip_code_prefix) REFERENCES geolocation(geolocation_zip_code_prefix) -- Foreign Key
);

CREATE TABLE orders (
    order_id NVARCHAR(450) PRIMARY KEY,
    customer_id NVARCHAR(450),
    order_status VARCHAR(8000), -- Order Status
    order_purchase_timestamp DATETIME2(3), -- Timestamp with fractional seconds (YYYY-MM-DD HH:MM:SS.fff)
    order_approved_at DATETIME2(3), -- Timestamp with fractional seconds (YYYY-MM-DD HH:MM:SS.fff)
    order_delivered_carrier_date DATETIME2(3), -- Timestamp with fractional seconds (YYYY-MM-DD HH:MM:SS.fff)
    order_delivered_customer_date DATETIME2(3), -- Timestamp with fractional seconds (YYYY-MM-DD HH:MM:SS.fff)
    order_estimated_delivery_date DATE, -- Date (YYYY-MM-DD)
    --CONSTRAINT fk_customer_order FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- Foreign Key referencing orders
);

CREATE TABLE products (
    product_id NVARCHAR(450) PRIMARY KEY,
    product_category_name VARCHAR(8000), -- Category Name
    product_name_length FLOAT, -- Double equivalent in SQL Server
    product_description_length FLOAT, -- Double equivalent in SQL Server
    product_photos_qty FLOAT, -- Double equivalent in SQL Server
    product_weight_g FLOAT, -- Weight in grams (double)
    product_length_cm FLOAT, -- Length in cm (double)
    product_height_cm FLOAT, -- Height in cm (double)
    product_width_cm FLOAT -- Width in cm (double)
);

CREATE TABLE order_items (
    order_items_row_identifier INTEGER PRIMARY KEY, -- Primary Key
    order_id NVARCHAR(450), -- Foreign key referencing orders
    order_item_id INTEGER,
    product_id NVARCHAR(450), -- Foreign key referencing products
    seller_id NVARCHAR(450), -- Foreign key referencing sellers
    shipping_limit_date DATETIME2(3), -- Timestamp (YYYY-MM-DD HH:MM:SS.fff)
    price FLOAT, -- Double equivalent in SQL Server
    freight_value FLOAT, -- Double equivalent in SQL Server
    --CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id), -- Foreign Key referencing orders
    --CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id), -- Foreign Key referencing products
    --CONSTRAINT fk_seller FOREIGN KEY (seller_id) REFERENCES sellers(seller_id) -- Foreign Key referencing sellers
);

CREATE TABLE order_payments (
    order_id NVARCHAR(450) PRIMARY KEY, -- Primary Key and Foreign Key referencing orders
    payment_installments BIT, -- Boolean type for whether has installments
    payment_value FLOAT, -- Payment value (double type)    
    payment_type VARCHAR(8000), -- Type of payment (e.g., credit card, debit card)
    --CONSTRAINT fk_order_payment FOREIGN KEY (order_id) REFERENCES orders(order_id) -- Foreign Key referencing orders
);

CREATE TABLE order_reviews (
    review_id NVARCHAR(450) PRIMARY KEY,
	order_id NVARCHAR(450), -- Foreign key referencing orders
    review_score INTEGER, -- Long type equivalent in SQL Server
    review_comment_title VARCHAR(8000), -- Comment title
    review_comment_message VARCHAR(8000), -- Comment message
    review_creation_date DATETIME2(3), -- Timestamp (YYYY-MM-DD HH:MM:SS.fff)
    review_answer_timestamp DATETIME2(3), -- Timestamp (YYYY-MM-DD HH:MM:SS.fff)
    --CONSTRAINT fk_order_review FOREIGN KEY (order_id) REFERENCES orders(order_id) -- Foreign Key Constraint referencing orders
);

CREATE TABLE qualified_leads (
    mql_id NVARCHAR(450) PRIMARY KEY,
    first_contact_date DATE, -- First contact date (YYYY-MM-DD)
    landing_page_id VARCHAR(8000), -- Landing page identifier
    origin VARCHAR(8000) -- Origin of the lead
);

CREATE TABLE closed_deals (
    mql_id NVARCHAR(450) PRIMARY KEY, -- also foreign key
    seller_id NVARCHAR(450), --foreign key
    sdr_id VARCHAR(8000), -- Sales Development Representative ID
    sr_id VARCHAR(8000), -- Sales Representative ID
    won_date DATETIME2(3), -- Timestamp (YYYY-MM-DD HH:MM:SS.fff)
    business_segment VARCHAR(8000), -- Business segment
    lead_type VARCHAR(8000), -- Type of lead
    lead_behaviour_profile VARCHAR(8000), -- Behaviour profile of the lead
    has_company BIT, -- Boolean type for has company
    has_gtin BIT, -- Boolean type for has GTIN
    average_stock VARCHAR(8000), -- Average stock
    business_type VARCHAR(8000), -- Type of business
    declared_product_catalog_size FLOAT, -- Declared product catalog size (double type)
    declared_monthly_revenue FLOAT, -- Declared monthly revenue (double type)
    --CONSTRAINT fk_mql_closed_deal FOREIGN KEY (mql_id) REFERENCES qualified_leads(mql_id), -- Foreign Key Constraint
    --CONSTRAINT fk_seller_closed_deal FOREIGN KEY (seller_id) REFERENCES sellers(seller_id) -- Foreign Key Constraint
);