-- In case there is already a bank_homework database, drop it
DROP DATABASE bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework

-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at DATE,
  amount NUMERIC(100,2),--could use MONEY, but I prefer NUMERIC as it takes math
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode VARCHAR;

-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-4-30', '500.34', 'meghan', 'steviedog', '02129', 'Payment for a car');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-4-29', '200.67', 'george', 'meghan', '10580', 'Purse from Coach');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-4-29', '100.00', 'meghan', 'steviedog', '02129', 'Tickets to concert');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-4-27', '55.45', 'steviedog', 'meghan', '02129', 'Spotify subscription');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-4-14', '500.99', 'meghan', 'steviedog', '02129', 'Weekend in NYC');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-4-10', '1.23', 'george', 'meghan', '90210', 'Pack of gum');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-3-30', '0.23', 'meghan', 'george', '02129', 'Gallon of milk');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-3-10', '900.99', 'george', 'meghan', '10804', 'Two round-trip tickets to San Francisco');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-3-1', '1245.33', 'meghan', 'steviedog', '02129', '');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-2-22', '1.00', 'steviedog', 'meghan', '02129', '');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-2-21', '175.25', 'meghan', 'steviedog', '90210', 'Payment for a car');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-2-21', '75.75', 'george', 'ashley', '10804', 'Parking ticket');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-2-21', '125.50', 'george', 'meghan', '02129', 'Parking ticket');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-2-14', '310.50', 'meghan', 'george', '10804', 'Insurance payment');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-2-1', '25.75', 'ashley', 'courtney', '90210', 'Lunch');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-1-30', '16.50', 'george', 'meghan', '10804', 'Knife sharpener');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-1-22', '34.34', 'george', 'meghan', '90210', 'Toothpaste');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2014-1-3', '17.65', 'steviedog', 'courtney', '02129', 'Thermometer');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2013-12-15', '9003.23', 'steviedog', 'meghan', '02129', 'Used car');
INSERT INTO payments(created_at, amount, payer_name, recipient_name, zipcode, description)
  VALUES('2012-10-2', '1.01', 'ashley', 'meghan', '90210', 'Stamps');
-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = '1255.33' WHERE id = '9';

-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < '2.00';

-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name FROM payments;
-- or --
SELECT recipient_name FROM payments GROUP BY recipient_name;

-- In a single query, select all payments created in the past week
SELECT * FROM payments WHERE created_at > '2014-4-23' AND created_at < '2014-5-1';

-- In a single query, select all payments with a blank description
SELECT * FROM payments WHERE description ='';

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments WHERE payer_name = 'steviedog';




-- I assumed you wanted me to select all 'SELECT *', but I could have just output the
-- payment amount or payer by exchanging the '*' with 'amount' or 'payer_name'.
-- I could have output both by exchanging the '*' with 'amount, payer_name' etc.


