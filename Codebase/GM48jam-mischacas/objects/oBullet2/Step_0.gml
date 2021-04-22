/// @description Insert description here
// You can write your code in this editor
x+= lengthdir_x(spd,direction);
y+= lengthdir_y(spd,direction);
image_angle = direction;

//limit range
timer_init("range");
if timer_get("range") <= 0 {
	timer_set("range",20);
}
if timer_get("range") = 1 {instance_destroy(); instance_create_depth(x,y,depth,oDust);}

#region collisions
if (place_meeting(x,y,pShootable))
	{
		with(instance_place(x,y,pShootable))
		{
			hp-=2; //double damage
			flash = 3;
			hitfrom = other.direction;
		}
		instance_destroy();
		instance_create_depth(x,y,depth,oHitSpark);
	}

	//hit a wall
	if (place_meeting(x,y,oWall)) && (image_index !=0) 
	{
		while (place_meeting(x,y,oWall)) 
		{
			x-= lengthdir_x(1,direction);	//move back in direction
			y-= lengthdir_y(1,direction);
		}
		spd = 0;
		instance_change(oHitSpark,true);
		//layer_add_instance("Tiles_1",id);
		depth+=1;
	}

#endregion