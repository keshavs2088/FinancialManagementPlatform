CREATE TABLE attachments
(attachment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
business_id INT NOT NULL,
parent_type VARCHAR(20) NOT NULL CHECK (parent_type IN ('FINANCIAL_EVENT','ASSET','RECEIVABLE','PAYABLE')),
parent_id INT NOT NULL,
file_name VARCHAR(50) NOT NULL,
file_size_bytes INT NOT NULL,
file_type VARCHAR(5) NOT NULL CHECK(file_type IN ('PDF','JPG','JPEG','PNG')),
storage_uri VARCHAR(200) NOT NULL,
uploaded_by_membership_id INT NOT NULL,
removed_at TIMESTAMPTZ,
removed_by_membership_id INT,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_attachments_businesses
FOREIGN KEY (business_id)
REFERENCES businesses(business_id),

CONSTRAINT fk_attachments_upload_membership_id
FOREIGN KEY (uploaded_by_membership_id)
REFERENCES business_memberships(business_membership_id),

CONSTRAINT fk_attachments_removed_membership_id
FOREIGN KEY (removed_by_membership_id)
REFERENCES business_memberships(business_membership_id)
);