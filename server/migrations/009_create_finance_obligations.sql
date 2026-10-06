CREATE TABLE finance_obligations
(finance_obligation_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
obligation_name VARCHAR(100) NOT NULL,
opening_principal_amount DECIMAL(10,2),
opening_principal_date DATE,
closed_at DATE,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_finance_obligations_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id)
);