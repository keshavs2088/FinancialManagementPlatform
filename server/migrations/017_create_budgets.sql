CREATE TABLE budgets
(budget_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
location_id INT NOT NULL,
financial_year INT NOT NULL,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_budgets_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_budgets_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id)
);