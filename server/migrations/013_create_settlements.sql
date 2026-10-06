CREATE TABLE settlements
(settlement_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
financial_event_id INT NOT NULL,
settlement_date DATE NOT NULL,
reference VARCHAR(100),
description VARCHAR(255),
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_settlements_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_settlements_financial_events
FOREIGN KEY (financial_event_id)
REFERENCES financial_events(financial_event_id)
);