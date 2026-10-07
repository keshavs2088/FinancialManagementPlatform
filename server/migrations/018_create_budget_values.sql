CREATE TABLE budget_values
(budget_value_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
budget_id INT NOT NULL,
month INT NOT NULL CHECK(month>0 AND month<13),
income_amount DECIMAL(10,2) NOT NULL,
expense_amount DECIMAL(10,2) NOT NULL,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_budget_values_budgets
FOREIGN KEY (budget_id)
REFERENCES budgets(budget_id)
);