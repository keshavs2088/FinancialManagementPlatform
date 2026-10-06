CREATE TABLE business_memberships
(business_membership_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
user_id INT NOT NULL,
business_id INT NOT NULL,
role VARCHAR(10) NOT NULL CHECK(role IN ('OWNER', 'MANAGER')),
location_id INT,
is_active BOOLEAN NOT NULL DEFAULT TRUE,
deactivated_at TIMESTAMPTZ,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_business_memberships_users
FOREIGN KEY (user_id)
REFERENCES users(user_id),
CONSTRAINT fk_business_memberships_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),
CONSTRAINT fk_business_memberships_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id),

CONSTRAINT uq_business_membership_users_businesses
UNIQUE(user_id,business_id),
CONSTRAINT chk_business_membership_locations
CHECK((role='MANAGER' AND location_id IS NOT NULL) OR (role='OWNER' AND location_id IS NULL))
);