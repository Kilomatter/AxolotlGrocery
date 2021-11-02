spd = lerp(0,spd,0.2);

x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);

if (spd > 0.1)
	pickuppable = false;
else
	pickuppable = true;