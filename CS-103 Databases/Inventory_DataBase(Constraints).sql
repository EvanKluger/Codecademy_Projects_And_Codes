SELECT * FROM parts LIMIT 10;

ALTER TABLE parts 
ALTER COLUMN code SET NOT NULL;

ALTER TABLE parts
ADD UNIQUE (code);

UPDATE parts SET description = 'Nothing' WHERE description IS NULL;

ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

INSERT INTO parts VALUES(
  54,
  '3-Color LED',
  'V1-009',
  9
);

SELECT * FROM parts;

ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL;

ALTER TABLE reorder_options
ALTER COLUMN quantity SET NOT NULL;

ALTER TABLE reorder_options
ADD CHECK(quantity > 0 AND price_usd > 0);

ALTER TABLE reorder_options
ADD CHECK(price_usd/quantity < 25 AND price_usd/quantity > 0.02);

ALTER TABLE parts
ADD PRIMARY KEY (id);

ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id) REFERENCES parts(id);

ALTER TABLE locations
ADD CHECK (qty>0);

ALTER TABLE locations
ADD UNIQUE (part_id, location);

ALTER TABLE locations
ADD FOREIGN KEY (part_id) REFERENCES parts (id);

ALTER TABLE parts
ADD FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id);

INSERT INTO manufacturers(name, id) 
VALUES ('Pip-NNC Industrial', 11);

UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (1, 2);

