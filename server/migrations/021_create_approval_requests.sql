CREATE TABLE approval_requests
(approval_request_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
financial_event_id INT NOT NULL,
requested_by_membership_id INT NOT NULL,
action VARCHAR(10) NOT NULL CHECK(action IN ('EDIT','DELETE')),
reason VARCHAR(255),
status VARCHAR(10) NOT NULL CHECK (status IN('PENDING','APPROVED','REJECTED')),
decision_by_membership_id INT,
decision_at TIMESTAMPTZ,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_approval_requests_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_approval_requests_financial_events
FOREIGN KEY (financial_event_id)
REFERENCES financial_events(financial_event_id),

CONSTRAINT fk_approval_requests_requested_by_memberships
FOREIGN KEY (requested_by_membership_id)
REFERENCES business_memberships(business_membership_id),

CONSTRAINT fk_approval_requests_decision_by_memberships
FOREIGN KEY (decision_by_membership_id)
REFERENCES business_memberships(business_membership_id)
);