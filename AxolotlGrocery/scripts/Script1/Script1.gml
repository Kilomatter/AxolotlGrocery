// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_get_value(_value, _array){
	var _length = array_length(_array);
	
	for (var i = 0; i < _length; i++;)
	{
		if (_value == _array[i])
			return _array[i];
	}
	
	return noone;
}

function spawn_dropped_food(){
	
	if (ds_list_size(objManager.cart) > 0)
	{
		var random_list_item_position = irandom_range(0, ds_list_size(objManager.cart) - 1);
		var random_list_item = ds_list_find_value(objManager.cart, random_list_item_position);
	
		with instance_create_layer(objCart.x,objCart.y,"Instances",objFood)
		{
			image_index = random_list_item;
			food_type = random_list_item;
		}
	
		ds_list_delete(objManager.cart, random_list_item_position);
	}
	
}