CREATE TABLE financial_events
(financial_event_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
location_id INT,
transaction_category_id INT,
financial_account_id INT,
event_type VARCHAR(50) NOT NULL CHECK(event_type IN ('INCOME',
        'EXPENSE',
        'TRANSFER',
        'OWNER_CONTRIBUTION',
        'OWNER_WITHDRAWAL',
        'RECEIVABLE',
        'PAYABLE',
        'REFUND_REVERSAL',
        'BORROWING_FINANCE',
        'FINANCE_REPAYMENT',
        'CUSTOMER_DEPOSIT_ADVANCE',
        'ASSET_PURCHASE_DISPOSAL',
        'DEPRECIATION')),
reference VARCHAR(100),
description VARCHAR(200),
amount DECIMAL(10,2) NOT NULL,
effective_date DATE,
created_by_membership_id INT NOT NULL,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
deleted_at TIMESTAMPTZ,
deleted_by_membership_id INT,

CONSTRAINT fk_financial_events_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_financial_events_created_by_membership
FOREIGN KEY (created_by_membership_id)
REFERENCES business_memberships(business_membership_id),

CONSTRAINT fk_financial_events_deleted_by_membership
FOREIGN KEY (deleted_by_membership_id)
REFERENCES business_memberships(business_membership_id),

CONSTRAINT fk_financial_events_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id),

CONSTRAINT fk_financial_events_transaction_categories
FOREIGN KEY (transaction_category_id)
REFERENCES transaction_categories(transaction_category_id),

CONSTRAINT fk_financial_events_financial_accounts
FOREIGN KEY (financial_account_id)
REFERENCES financial_accounts(financial_account_id)
);