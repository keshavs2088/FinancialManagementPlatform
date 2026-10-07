CREATE TABLE forecast_items
(forecast_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
forecast_id INT NOT NULL,
item_type VARCHAR(10) NOT NULL CHECK(item_type IN ('INCOME','EXPENSE')),
description VARCHAR(255),
amount DECIMAL(10,2) NOT NULL,
created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
expires_on DATE NOT NULL,

CONSTRAINT fk_forecast_items_forecasts
FOREIGN KEY (forecast_id)
REFERENCES forecasts(forecast_id)
);