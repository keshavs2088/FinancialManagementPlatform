CREATE TABLE forecasts
(forecast_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
location_id INT NOT NULL,
forecast_month DATE NOT NULL,
generated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_forecasts_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_forecasts_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id)
);