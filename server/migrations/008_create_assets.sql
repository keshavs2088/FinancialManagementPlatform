CREATE TABLE assets
(asset_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
location_id INT NOT NULL,
asset_name VARCHAR(100) NOT NULL,
asset_type VARCHAR(50),
acquisition_date DATE NOT NULL,
acquisition_cost DECIMAL(10,2) NOT NULL,
useful_life_months INT NOT NULL,
residual_value DECIMAL(10,2),
description VARCHAR(200),
disposed_at DATE,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_assets_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_assets_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id)
);