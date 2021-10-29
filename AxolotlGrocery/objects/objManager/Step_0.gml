if (keyboard_check_pressed(vk_escape))
	game_end();
	
	
if (order_time <= 0)
{
	show_debug_message("you failed");
	room_restart();
}
else
	order_time --;