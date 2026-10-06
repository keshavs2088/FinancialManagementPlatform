CREATE TABLE receivables
(receivable_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
location_id INT,
origin_financial_event_id INT NOT NULL,
reference VARCHAR(100),
due_date DATE,
description VARCHAR(255),
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_receivables_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_receivables_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id),

CONSTRAINT fk_receivables_financial_events
FOREIGN KEY (origin_financial_event_id)
REFERENCES financial_events(financial_event_id)
);