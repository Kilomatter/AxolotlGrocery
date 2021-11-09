


if (!slipping)
{
	//Read Input
	key_forward = keyboard_check(vk_up);
	key_backward = keyboard_check(vk_down);
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_add = keyboard_check_pressed(vk_space);

	//Translate Input Into Movement Factors
	rotation_direction = (key_left - key_right);
	motion_direction = (key_forward - key_backward);	
	
	//Calculate and Apply Rotation
	rotation_amount = lerp(rotation_amount, rotation_direction * top_rotation_speed, 0.2);
	direction += rotation_amount;

	//Calculate Motion
	motion_amount = lerp(motion_amount, motion_direction * top_speed, 0.05);
	
	//Hitting a Slip Trap
	if (place_meeting(x,y,objSlipHazard) and slippable)
	{
		slipping = true;
		spawn_dropped_food();
		audio_play_sound(sfxSpinOut,0,false);
	}
}

//Slipping
if (slipping)
{
	motion_amount -= 0.03;
	
	if (abs(motion_amount <= 0.06))
	{
		if (place_meeting(x,y,objSlipHazard))
			slippable = false;
		slipping = false;
	}
}

if (not slippable and not(place_meeting(x,y,objSlipHazard)))
	slippable = true;

//Calculate Motion 2
x_motion_amount = lengthdir_x(motion_amount, direction);
y_motion_amount = lengthdir_y(motion_amount, direction);

//Check for Collisions
if (place_meeting(x + x_motion_amount, y, objCollision))
{
	while(!place_meeting(x + sign(x_motion_amount), y, objCollision))
	{
		x += sign(x_motion_amount);
	}
	
	if (motion_amount > 1 and abs(x_motion_amount) > abs(y_motion_amount))
	{
		collided = true;
		spawn_dropped_food();
		x_motion_amount *= -1;
		audio_play_sound(sfxCartBump,0,false);
		motion_amount *= -1;
	}
}
else
{
	x += x_motion_amount;
}
	
if (place_meeting(x, y + y_motion_amount, objCollision))
{
	while(!place_meeting(x, y + sign(y_motion_amount), objCollision))
	{
		y += sign(y_motion_amount);
	}
	//y_motion_amount = 0;
	motion_direction = 0;
	
	if (motion_amount > 1 and abs(y_motion_amount) > abs(x_motion_amount))
	{
		collided = true;
		spawn_dropped_food();
		x_motion_amount *= -1;
		audio_play_sound(sfxCartBump,0,false);
		motion_amount *= -1;
	}
}
else
{
	y += y_motion_amount;
}

//Hitting a wall



//Animate Sprite
image_index = (direction / 45 + 0.5);

//Adding Items to Cart
if (key_add and place_meeting(x, y, objFoodParent))
{
	var target_tile = instance_nearest(x, y, objFoodParent)
	if (target_tile.pickuppable == true)
	{
		ds_list_add(objManager.cart, target_tile.food_type);
	
		with instance_create_layer(x,y,"UI",objFoodPickup)
		{
			image_index = target_tile.food_type;
		}
		
		audio_play_sound(sfxItemGain,0,false);
	}
	
	if (target_tile.deletable == true)
		instance_destroy(target_tile,0);
}

//Checking Out
if (place_meeting(x,y,objCheckout) and objManager.order_is_complete == true)
{
	audio_play_sound(sfxOrderComplete,0,false);
	
	//Clearing the Cart
	while(ds_list_size(objManager.order) > 0)
	{
		var current_item = ds_list_find_value(objManager.order,0);
		ds_list_delete(objManager.order,0);
		
		ds_list_delete(objManager.cart,ds_list_find_index(objManager.cart,current_item));
	}
	
	//Regenerate Order
	objManager.order_is_complete = false;
	objManager.order_time = 30 * 60;
	
	for(var i = 0; i < objManager.order_length; i++;)
	{
		ds_list_add(objManager.order, (irandom_range(0,array_length(objManager.food_pool)-1)));
	}
}

//Update Depth
depth = -y;
