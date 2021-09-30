
//Read Input
key_forward = keyboard_check(vk_up);
key_backward = keyboard_check(vk_down);
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

//Translate Input Into Movement Factors
rotation_direction = (key_left - key_right);
motion_direction = (key_forward - key_backward);

//Calculate and Apply Rotation
rotation_amount = lerp(rotation_amount, rotation_direction * top_rotation_speed, 0.2);
direction += rotation_amount;

//Calculate Motion
motion_amount = lerp(motion_amount, motion_direction * top_speed, 0.05);
x_motion_amount = lengthdir_x(motion_amount, direction);
y_motion_amount = lengthdir_y(motion_amount, direction);

//Check for Collisions
if (place_meeting(x + x_motion_amount, y, objWall))
{
	while(!place_meeting(x + sign(x_motion_amount), y, objWall))
	{
		x += sign(x_motion_amount);
	}
	//x_motion_amount = 0;
	//motion_direction = 0;
}
else
{
	x += x_motion_amount;
}
	
if (place_meeting(x, y + y_motion_amount, objWall))
{
	while(!place_meeting(x, y + sign(y_motion_amount), objWall))
	{
		y += sign(y_motion_amount);
	}
	//y_motion_amount = 0;
	motion_direction = 0;
}
else
{
	y += y_motion_amount;
}

//Apply Motion



//Animate Sprite
image_index = (direction / 45 + 0.5);