CREATE TABLE customer_deposits
(customer_deposit_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
location_id INT,
reference VARCHAR(100),
description VARCHAR(200),
opening_amount DECIMAL(10,2),
opening_date DATE,
closed_at DATE,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_customer_deposits_businesses
FOREIGN KEY(business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_customer_deposits_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id)
);