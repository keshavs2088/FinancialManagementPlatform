CREATE TABLE approval_changes
(approval_change_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
approval_request_id INT NOT NULL,
field_name VARCHAR(255) NOT NULL,
old_value VARCHAR(255),
new_value VARCHAR(255),
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_approval_changes_approval_requests
FOREIGN KEY (approval_request_id)
REFERENCES approval_requests(approval_request_id)
);