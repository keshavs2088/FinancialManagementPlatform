CREATE TABLE locations
(location_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
location_name VARCHAR(255) NOT NULL,
address_line1 VARCHAR(255) NOT NULL,
address_line2 VARCHAR(255),
suburb VARCHAR(100) NOT NULL,
state VARCHAR(100) NOT NULL,
postcode VARCHAR(20) NOT NULL,
active_through_date DATE NOT NULL,
archived_at TIMESTAMPTZ,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,


CONSTRAINT fk_locations_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id)
);