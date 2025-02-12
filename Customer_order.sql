USE Sandwicheria_shop;

CREATE TABLE IF NOT EXISTS Credit_card
(
	credit_card_ID INT NOT NULL UNIQUE,
    card_type VARCHAR(20) NOT NULL,
    card_number VARCHAR(20) NOT NULL,
    card_holder_name VARCHAR(50) NOT NULL,
    expiration_date DATETIME NOT NULL,
    CONSTRAINT Validation_expiration_date CHECK (expiration_date > date(now()) ),
    
	CONSTRAINT PKcredit_card_ID primary key (credit_card_ID)
);

-- Pending to solve
ALTER TABLE Credit_Card
	with check add constraint Validation_credit_card_house CHECK (card_type IN('VISA', 'Mastercard', 'American Express', 'Discover') );


CREATE TABLE IF NOT EXISTS Customer
(
	customer_ID INT NOT NULL UNIQUE,
    customer_name VARCHAR(50) NOT NULL,
    phone_number varchar(20)  NULL,
    account_number VARCHAR(20) NULL,
    CONSTRAINT PKcustomer_ID PRIMARY KEY (customer_ID)
);