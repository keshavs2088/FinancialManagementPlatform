CREATE TABLE financial_accounts
(financial_account_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
account_name VARCHAR(200) NOT NULL,
account_type VARCHAR(50) NOT NULL,
opening_balance_amount DECIMAL (10,2) NOT NULL,
opening_balance_date DATE NOT NULL,
closed_date DATE,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_financial_accounts_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id)
);