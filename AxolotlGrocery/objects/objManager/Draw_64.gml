draw_set_halign(fa_left);

var temp_order = ds_list_create();
var temp_cart = ds_list_create();

ds_list_copy(temp_order, order);
ds_list_copy(temp_cart, cart);
	
order_is_complete = true;
for (var i = 0; i < ds_list_size(order); i++;)
{
	var current_item = ds_list_find_value(order, i);
	if (ds_list_find_index(temp_cart, current_item) != -1)
	{
		ds_list_delete(temp_order,i);
		ds_list_delete(temp_cart,ds_list_find_index(temp_cart, current_item));
		
		draw_set_color(c_green);
	}
	else
	{
		draw_set_color(c_red);
		order_is_complete = false;
	}
	
	draw_text(8,16 * i, current_item);	
}

ds_list_destroy(temp_order);
ds_list_destroy(temp_cart);

draw_set_color(c_black);


draw_set_halign(fa_right);
for (var i = 0; i < ds_list_size(cart); i++)
{
	draw_text(room_width - 16, 16 * i, ds_list_find_value(cart,i));
}