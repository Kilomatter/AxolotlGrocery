
//Movement
xdist = lengthdir_x(spd,dir);
ydist = lengthdir_y(spd,dir);

if (place_meeting(x + xdist, y, objWall))
{
	while (not place_meeting(x + sign(xdist), y, objWall))
		x += sign(xdist);
}
else
	x += xdist;
	

if (place_meeting(x, y + ydist, objWall))
{
	while (not place_meeting(x, y + sign(ydist), objWall))
		y += sign(ydist);
}
else
	y += ydist;

//
if (spd > 0.1)
	pickuppable = false;
else
	pickuppable = true;

if (spd > 0)
{
	spd = lerp(spd, 0, 0.1);
}
	