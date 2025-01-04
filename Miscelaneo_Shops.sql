use Sandwicheria_shop;

CREATE TABLE IF NOT EXISTS Delivery_type
(
	delivery_type_ID INT NOT NULL AUTO_INCREMENT,
    delivery_type_name VARCHAR(50) NOT NULL,
    CONSTRAINT PKDelivery_type PRIMARY KEY (delivery_type_ID),
    CONSTRAINT AKDelivery_type UNIQUE (delivery_type_name)
);

CREATE TABLE IF NOT EXISTS Sandwich_Shop
(
	sandwich_shop_ID INT NOT NULL AUTO_INCREMENT,
    sandwich_shop_name VARCHAR(50) NOT NULL,
    CONSTRAINT PKSandwich_Shop PRIMARY KEY (sandwich_shop_ID),
    CONSTRAINT AKSandwich_Shop UNIQUE (sandwiche_shop_name)
);

CREATE TABLE IF NOT EXISTS Location_Address
(
	location_address_ID INT NOT NULL AUTO_INCREMENT,
    address_string VARCHAR(80) NOT NULL,
    CONSTRAINT PKLocation_Address PRIMARY KEY (location_address_ID)
);

CREATE TABLE IF NOT EXISTS Location
(
	location_ID INT NOT NULL AUTO_INCREMENT,
    phone_number INT NOT NULL,
    sandwich_shop_ID INT NOT NULL,
    location_address_ID INT NOT NULL,
    menu_ID INT NOT NULL,
    CONSTRAINT PKLocation PRIMARY KEY (location_ID),
    CONSTRAINT FK1Location FOREIGN KEY (sandwich_shop_ID),
    CONSTRAINT FK2Location FOREIGN KEY (location_address_ID),
    CONSTRAINT FK3Location FOREIGN KEY (menu_ID)
);