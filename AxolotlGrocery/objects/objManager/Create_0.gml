//Create the food pool
food_pool[0] = "apple";
food_pool[1] = "bananas";

cart = ds_list_create();
order = ds_list_create();

order_length = 3;
order_is_complete = false;

for(var i = 0; i < order_length; i++;)
{
	ds_list_add(order, food_pool[(irandom_range(0,array_length(food_pool)-1))]);
}
