key_forward = keyboard_check(vk_up);
key_backward = keyboard_check(vk_down);
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

rotation = (key_left - key_right);
motion_direction = (key_forward - key_backward);

direction += rotation;
speed = lerp(speed,motion_direction * top_speed,0.1);

image_index = (direction / 45 + 0.5);