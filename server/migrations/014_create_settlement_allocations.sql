CREATE TABLE settlement_allocations
(settlement_allocation_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
settlement_id INT NOT NULL,
receivable_id INT,
payable_id INT,
amount DECIMAL(10,2) NOT NULL,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_settlement_allocations_settlements
FOREIGN KEY (settlement_id)
REFERENCES settlements(settlement_id),

CONSTRAINT fk_settlement_allocations_receivables
FOREIGN KEY (receivable_id)
REFERENCES receivables(receivable_id),

CONSTRAINT fk_settlement_allocations_payables
FOREIGN KEY (payable_id)
REFERENCES payables(payable_id),

CONSTRAINT chk_settlement_allocation_target
CHECK((receivable_id IS NULL AND payable_id IS NOT NULL) OR (receivable_id IS NOT NULL AND payable_id IS NULL))
);