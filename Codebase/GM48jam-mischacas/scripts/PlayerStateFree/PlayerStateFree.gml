// Player IDLE, WALK, JUMP
function PlayerStateFree(){
	
#region walking
	
	//Slow down while shooting
	var slowwalk = 0.5; 
	current_walkspd = 3;
	if current_weapon != 0 && mouse_check_button(mb_left) = true {
	slowwalk = 0.5;
	} else slowwalk = 1;
	
	//accelerate
	var move_hor = key_right - key_left;
	var move_ver = key_down - key_up; 
	
	hsp = (move_hor * current_walkspd);
	vsp = (move_ver * current_walkspd);
	
#endregion
}
	
	
function PlayerDebugControls(){
	if (key_restart_room = 1) {room_restart();}
	if (key_quit_game) {game_end();}
}

function PlayerShoot() {
	
	//GMLive
	if (live_call()) return live_result; 

	timer_init("bullet_load1");
	timer_init("bullet_load2");
	
	//gun 1
	if (key_primary) && timer_get("bullet_load1") <= 0 {
		if ammo_type1 > 0 {
			dd = instance_create_depth(x,y,depth,oBullet1);
			dd.direction = point_direction(x,y,mouse_x,mouse_y);;
			timer_set("bullet_load1",10);
			ScreenShake(1,2);
			ammo_type1 -=1; 
		}
	}
	
	//gun 2 = shotgun
	if (key_secondary) && timer_get("bullet_load2") <= 0 {
		if ammo_type2 > 0 {
			dd = instance_create_depth(x,y,depth,oBullet2);
			dd.direction = point_direction(x,y,mouse_x,mouse_y);		
			
			ee = instance_create_depth(x,y,depth,oBullet2);
			ee.direction = point_direction(x,y,mouse_x,mouse_y)+20;	
			
			ff = instance_create_depth(x,y,depth,oBullet2);
			ff.direction = point_direction(x,y,mouse_x,mouse_y)-20;	
			
			timer_set("bullet_load2",40);
			ScreenShake(2,4);
			ammo_type2 -=1; 
		}
	}
}