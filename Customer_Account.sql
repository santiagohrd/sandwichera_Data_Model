USE Sandwicheria_shop;

CREATE TABLE IF NOT EXISTS Customer_Account
(
    account_ID INT NOT NULL AUTO_INCREMENT UNIQUE,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    encrypted_password VARCHAR(20) NOT NULL,
    CONSTRAINT PKaccount_id PRIMARY KEY (account_ID)
);

CREATE TABLE IF NOT EXISTS Address
(
    address_ID INT NOT NULL AUTO_INCREMENT UNIQUE,
    address_string VARCHAR(200) NOT NULL,
    city VARCHAR(30) NULL,
    state VARCHAR(30) NULL,
    postal_code VARCHAR(10) NULL,
    customer_account_ID INT NULL,
    CONSTRAINT PKaddress_ID PRIMARY KEY (address_ID),
    CONSTRAINT FKcustomer_account_ID_Address FOREIGN KEY (customer_account_ID) REFERENCES Customer_Account(account_ID)
);

CREATE TABLE IF NOT EXISTS Credit_Card
(
    credit_card_ID INT NOT NULL AUTO_INCREMENT UNIQUE,
    card_holder_name VARCHAR(50) NOT NULL,
    expiration_date DATETIME NOT NULL,
    card_type VARCHAR(20) NOT NULL,
    customer_account_ID INT NULL,
    CONSTRAINT PKcredit_card_ID PRIMARY KEY (credit_card_ID),
    CONSTRAINT FKcustomer_account_ID_CreditCard FOREIGN KEY (customer_account_ID) REFERENCES Customer_Account(account_ID)
);

ALTER TABLE Customer_Account 
ADD COLUMN address_ID INT NULL,
ADD COLUMN credit_card_ID INT NULL,
ADD CONSTRAINT FKaddress_ID FOREIGN KEY (address_ID) REFERENCES Address(address_ID),
ADD CONSTRAINT FKcredit_card_ID FOREIGN KEY (credit_card_ID) REFERENCES Credit_Card(credit_card_ID);