/// @description Insert description here
x+= lengthdir_x(spd,direction);
y+= lengthdir_y(spd,direction);

//limit range
timer_init("range");
if timer_get("range") <= 0 {
	timer_set("range",range_bullet);
}
if timer_get("range") = 1 {
	instance_destroy(); 
	instance_create_depth(x,y,depth,oDust);
	instance_create_depth(x,y,depth,oHitSpark);
	}



if collision_wall
{
	if (place_meeting(x,y,oWall)) && (image_index !=0) 
	{
		while (place_meeting(x,y,oWall)) 
		{
			x-= lengthdir_x(1,direction);	//move back in direction
			y-= lengthdir_y(1,direction);
		}
		spd = 0;
		instance_change(oHitSpark,true);
	}
}


//hit player
if (place_meeting(x,y,oPlayer)) 
{
	with(instance_place(x,y,oPlayer))
	{
		hp-=other.damage;
		flash = 3;
		//hitfrom = other.direction;
		ScreenShake(2,4);
		
		if hp < 1 KillPlayer();
	}
	instance_create_depth(x,y,depth,oHitSpark);
	instance_destroy();
	//sfx
	audio_sound_pitch(snd_bulletHit,1.4);
	audio_sound_gain(snd_bulletHit,0.4,0);
	audio_play_sound(snd_bulletHit,0,0);
}

if destroy_self
{
	instance_destroy();
}
