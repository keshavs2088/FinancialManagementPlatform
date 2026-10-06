CREATE TABLE customer_deposit_applications
(customer_deposit_application_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
customer_deposit_id INT NOT NULL,
income_financial_event_id INT NOT NULL,
amount DECIMAL(10,2) NOT NULL,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_customer_deposit_applications_customer_deposits
FOREIGN KEY(customer_deposit_id)
REFERENCES customer_deposits(customer_deposit_id),

CONSTRAINT fk_customer_deposit_applications_financial_events
FOREIGN KEY (income_financial_event_id)
REFERENCES financial_events(financial_event_id)
);