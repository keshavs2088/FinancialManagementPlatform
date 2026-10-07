CREATE TABLE import_batches
(import_batch_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
import_type VARCHAR(20) NOT NULL CHECK(import_type IN ('HISTORICAL','DAILY')),
file_name VARCHAR(50) NOT NULL,
content_hash VARCHAR(100) NOT NULL,
imported_by_membership_id INT NOT NULL,
status VARCHAR(10) NOT NULL CHECK(status IN ('SUCCESS','FAILED')),
processed_at TIMESTAMPTZ,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_import_batches_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_import_batches_business_memberships
FOREIGN KEY (imported_by_membership_id)
REFERENCES business_memberships(business_membership_id),

CONSTRAINT uq_import_batches_businesses_content_hash
UNIQUE(business_id, content_hash)
);