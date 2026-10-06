CREATE TABLE transaction_categories
(transaction_category_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
category_name VARCHAR(100) NOT NULL,
description VARCHAR(500),
archived_at TIMESTAMPTZ,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_transaction_category_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id)
);