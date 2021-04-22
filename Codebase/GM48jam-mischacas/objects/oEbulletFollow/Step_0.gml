/// @description Insert description here
x+= lengthdir_x(spd,direction);
y+= lengthdir_y(spd,direction);

//limit range
timer_init("range");
timer_init("follow_player");

if timer_get("range") <= 0 {
	timer_set("range",range_bullet);
}

if timer_get("range") = 1 {
	instance_destroy(); 
	instance_create_depth(x,y,depth,oDust);
	instance_create_depth(x,y,depth,oHitSpark);
	}

//follow player code
if timer_get("follow_player") <= 0 {
	timer_set("follow_player",40);
}

if timer_get("follow_player") = 1 && instance_exists(oPlayer) {
	if direction < (point_direction(x,y,oPlayer.x, oPlayer.y)) 
	direction += (point_direction(x,y,oPlayer.x, oPlayer.y)*0.05); else
	direction -= (point_direction(x,y,oPlayer.x, oPlayer.y)*0.05);
}	

	//new direction = 90. Old direction = 0. How to get average = (a+b)/2

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
}

if destroy_self
{
	instance_destroy();
}
