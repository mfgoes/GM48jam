/// @description enemy movement
//gm live 
//if (live_call()) return live_result; 

//shoot at player 
timer_init("shoot");
timer_init("start_shooting");

if instance_exists(oPlayer) && start_shooting = 1 {
	if timer_get("shoot") <= 0 && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0){
		timer_set("shoot",shoot_frequency+random(25));
		dd = instance_create_depth(x,y,depth-1,oEbullet);
		dd.direction = point_direction(x,y,oPlayer.x,oPlayer.y)+random_range(-20,20);
		dd.spd = random_range(1,1.5);
	}
}
else exit;