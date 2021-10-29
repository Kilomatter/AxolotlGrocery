y = lerp(y,objCart.y - 64, 0.5);
x = objCart.x;

if (cooldown <= 0)
{
	if (image_alpha <= 0)
		instance_destroy(self,false);
		
	image_alpha -= 0.1;
}
else
	cooldown--;

