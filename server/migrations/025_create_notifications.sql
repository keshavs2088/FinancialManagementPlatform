CREATE TABLE notifications
(notification_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
recipient_membership_id INT NOT NULL,
type VARCHAR(100) NOT NULL,
title VARCHAR(255) NOT NULL,
message VARCHAR(255) NOT NULL,
related_entity_type VARCHAR(100),
related_entity_id INT,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_notifications_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_notifications_recipient_membership_id
FOREIGN KEY (recipient_membership_id)
REFERENCES business_memberships(business_membership_id)
);