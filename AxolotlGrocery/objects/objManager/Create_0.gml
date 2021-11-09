//Create the food pool
food_pool[3] = "strawberry";
food_pool[2] = "cheery";
food_pool[1] = "bananas";
food_pool[0] = "apple";

cart = ds_list_create();
order = ds_list_create();

ds_list_clear(order);
ds_list_clear(cart);

order_length = 4;
order_is_complete = false;
order_time = 30 /* seconds */ * 60 /* frames */;

for(var i = 0; i < order_length; i++;)
{
	ds_list_add(order, (irandom_range(0,array_length(food_pool)-1)));
}
