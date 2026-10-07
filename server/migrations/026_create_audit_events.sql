CREATE TABLE audit_events
(audit_event_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
actor_membership_id INT,
action VARCHAR(20) NOT NULL,
entity_type VARCHAR(20) NOT NULL,
entity_id INT NOT NULL,
metadata JSONB NOT NULL,
occurred_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_audit_events_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_audit_events_actor_membership_id
FOREIGN KEY (actor_membership_id)
REFERENCES business_memberships(business_membership_id)
);