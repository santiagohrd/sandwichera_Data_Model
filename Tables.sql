create database Sandwicheria_shop;

USE Sandwicheria_shop;

CREATE TABLE IF NOT EXISTS Menu_Item (
  menu_item_type varchar(20) NOT NULL,
  menu_item_name varchar(50) NOT NULL,
  menu_size_type_ID INT NOT NULL,
  menu_item_ID INT NOT NULL AUTO_INCREMENT,
  menu_ID INT NOT NULL,
  CONSTRAINT PKMenu_Item PRIMARY KEY (menu_item_ID)
);

CREATE TABLE IF NOT EXISTS menu_item_size_type (
	size_type_ID INT NOT NULL AUTO_INCREMENT,
    size_type_name ENUM('small', 'medium', 'large', 'x-large') NOT NULL,
    CONSTRAINT PKmenu_item_size_type PRIMARY KEY (size_type_ID)
);

ALTER TABLE Menu_Item
	 ADD CONSTRAINT CK_Menu_Item_Type CHECK  ( menu_item_type IN ('beverage', 'salad', 'soup', 'sandwich') );

CREATE TABLE IF NOT EXISTS Discount
( 
	discount_name varchar(50) NOT NULL,
	discount_ID INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT PKDiscount PRIMARY KEY (discount_ID),
	CONSTRAINT AK1Discount UNIQUE (discount_name)
);

CREATE TABLE IF NOT EXISTS List_Price(
	list_price_amount DECIMAL NOT NULL,
    menu_item_ID INT NOT NULL,
    discount_ID INT NOT NULL,
    CONSTRAINT PKList_Price PRIMARY KEY (menu_item_ID asc, discount_ID asc)
);

CREATE TABLE IF NOT EXISTS Item_Ingredient
( 
	item_ingredient_name varchar(50)  NOT NULL ,
	item_ingredient_ID INT NOT NULL AUTO_INCREMENT,
	menu_item_ID INT NOT NULL ,
	CONSTRAINT PKItem_Ingredient PRIMARY KEY (item_ingredient_ID)
);

CREATE TABLE IF NOT EXISTS Ingredient_Choice
( 
	ingredient_choice_name varchar(50)  NOT NULL ,
	ingredient_choice_ID INT NOT NULL AUTO_INCREMENT,
	item_ingredient_ID INT NOT NULL ,
	CONSTRAINT PKIngredient_Choice PRIMARY KEY (ingredient_choice_ID)
);

CREATE TABLE IF NOT EXISTS Menu
( 
	menu_name varchar(50) NOT NULL ,
	menu_ID INT NOT NULL auto_increment,
	effective_date datetime NOT NULL ,
	expiration_date datetime NULL,
	CONSTRAINT PKMenu PRIMARY KEY (menu_ID),
	CONSTRAINT AK1Menu UNIQUE (menu_name)
);

ALTER TABLE Menu_Item
	ADD CONSTRAINT FK_Menu_Item_menu_ID_Menu FOREIGN KEY (menu_ID) REFERENCES Menu(menu_ID)
		ON DELETE CASCADE;
        
ALTER TABLE Menu_Item
	ADD CONSTRAINT FK FOREIGN KEY (menu_size_type_ID) REFERENCES menu_item_size_type(size_type_ID)
		ON DELETE CASCADE;

ALTER TABLE List_Price
	ADD CONSTRAINT FK_List_price_menu_item_ID_Menu_Item FOREIGN KEY (menu_item_ID) REFERENCES Menu_Item(menu_item_ID)
		ON DELETE CASCADE;

ALTER TABLE List_Price
	ADD CONSTRAINT FK_List_price_discount_ID_Discount FOREIGN KEY (discount_ID) REFERENCES Discount(discount_ID)
		ON DELETE NO ACTION;

ALTER TABLE Item_Ingredient
	ADD CONSTRAINT FK_Item_Ingredient_menu_item_ID_Menu_Item FOREIGN KEY (menu_item_ID) REFERENCES Menu_Item(menu_item_ID)
		ON DELETE CASCADE;

ALTER TABLE Ingredient_Choice
	ADD CONSTRAINT FK_ingredient_Choice_item_ingredient_ID_Item_Ingredient FOREIGN KEY (item_ingredient_ID) REFERENCES Item_Ingredient(item_ingredient_ID)
		ON DELETE CASCADE;