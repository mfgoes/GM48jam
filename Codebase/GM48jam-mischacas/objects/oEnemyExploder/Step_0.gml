/// @description enemy movement
//gm live 
if (live_call()) return live_result; 

//shoot at player 
timer_init("move_random"); //move around randomly (mainly move towards player

if instance_exists(oPlayer) {
	if distance_to_object(oPlayer) <=sight_range && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0) {
		//move towards player	
		
		var dir = point_direction(x,y,oPlayer.x,oPlayer.y);
		
		hsp = lengthdir_x(walkspd,dir);
		vsp = lengthdir_y(walkspd,dir);
		
		//move smoothly 
		if (place_meeting(x+hsp,y, oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x + sign(hsp); 
			}
			hsp = 0;
		}
		x = x + hsp;
		
		if (place_meeting(x,y+vsp, oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp); 
			}
			vsp = 0;
		}
		y = y + vsp;		
		image_speed = 0.3;
} 
else { //else stand still
	image_speed = 0;
}

	//explode on contact
	if place_meeting(x,y,oPlayer) {
		with(instance_place(x,y,oPlayer))
		{
			hp-=other.damage;
			flash = 3;
			hitfrom = other.direction;
			ScreenShake(3,10);
			if hp < 1 KillPlayer();
		}
		instance_change(oPoofedObject,1);
	}
}
