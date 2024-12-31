# sandwichera_Data_Model
Case Study Problem
I analyzed the business of a sandwich shop named Sandwicheria. This case study is a project I am working on to improve my data modeling skills.

-Prepare software for online ordering from Sandwicheria shop. The shop has multiple locations and food can be ordered from any location.
-Customers can order a variety of menu items (soups, salads, sandwiches, and beverage). Each menu item has a list price that can vary depending on whether there is a discount.
Some items are sold as is, such as beverages. Other items are customizable, such as sandwiches. Each sandwich has a choice of bread, cheese, and meat.
An order has a means of delivery. For example, a customer might pick up the order at a store or prefer to have it delivered to an address.
-Since this is a online system, the shop only support credit card payments. In the future it may include other methods.
-The software should allow users to create an account and register their data so that it is easier to submit an order. However, it should also support customers that lack and account and just want to submit an order and be done with it.

This is data Model for the Menu definition application. This application defines menu content and pricing reduced by the other applications.
The other applications can read the menu data but cannot alter it. 

The Menu table is a collection of items that the Sandwicheria offers to sale for some period of time. 
	-menu_name has a unique name for convenient reference
	-effective_date specifies when the menu is available for customers purchases
	-expiration_date specifies when the menu is no longer in effect. In case is null means that the menu is indefinitely applies or applies until the expiration_date has changed.

The Menu_item is a product that the Sandwicheria offers to sale. For example Special Individual Sandwich, large garden salad or a medium coffe.
	-menu_item_type is a string with possible values as beverage, salad, soup, and dessert.
	-menu_item_name is the name of the product
	-menu_item_size has attributes as large, small
	

The List_price has the prices for the menu_item that can have multiple list prices, one for each kind of discount, examples of discounts include none and senior.

item_ingredients: The menu_item can be composed of various item_ingredients. For example a sandwich could consist of bread, meat, and cheese.

Ingredient_choice: Each item_ingredient can have alternative ingredient choices. For example, cheese could have the options of Swiss or cheddar
