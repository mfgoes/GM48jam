/// @description Insert description here
// You can write your code in this editor
if (hp <= 0) {
	ScreenShake(1,5);
	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,y,"Instances",oDust)) {
			vsp = -0.1; image_alpha = 0.3+random(0.3);
			hsp = random_range(-1,1)
			image_xscale = choose (1,-1);
			image_yscale = choose (1,-1);
		}		
	}
	instance_destroy();
}
