/// @description Insert description here
// You can write your code in this editor
hsp = 0;
vsp = 0;
alarm[0] = 70;
done = 0;
image_index = 0;
image_speed = 0;
//sprite_index = sPlayerDie;
//generate poof here

ScreenShake(3,50);
audio_play_sound(snDeath,10,false);
game_set_speed(40,gamespeed_fps);

with(oCamera) follow = other.id;


//poof
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