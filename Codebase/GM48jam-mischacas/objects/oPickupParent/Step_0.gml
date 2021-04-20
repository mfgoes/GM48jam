/// @description Insert description here
// You can write your code in this editor
// You can write your code in this editor
if (place_meeting(x,y, oPlayer)) {
	ScreenShake(1,3);
	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,y,"Instances",oDust)) {
			vsp = -0.2; 
			image_xscale = choose (1,-1);
			image_yscale = choose (1,-1);
		}		
	}
}