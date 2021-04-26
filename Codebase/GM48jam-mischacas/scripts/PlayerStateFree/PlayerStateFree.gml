// Player IDLE, WALK, JUMP
function PlayerStateFree(){
	
#region walking
	
	//Slow down while shooting
	var slowwalk = 0.5; 
	current_walkspd = walkspd;
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
	if (key_debug) {global.debugmode = !(global.debugmode);}
}

function PlayerShoot() {
	
	//GMLive
	//if (live_call()) return live_result; 

	timer_init("bullet_load1");
	timer_init("bullet_load2");
	
	//gun 1
	if (key_primary) && timer_get("bullet_load1") <= 0 {
		if ammo_type1 > 0 {
			dd = instance_create_depth(x,y,depth,oBullet1);
			dd.direction = point_direction(x,y,mouse_x,mouse_y)+random_range(-5,5);
			timer_set("bullet_load1",28);
			ScreenShake(1,2);
			ammo_type1 -=1; 
			audio_sound_gain(sn_DT,0.4,0);
			audio_sound_pitch(sn_DT,0.7);
			audio_play_sound(sn_DT,3,0);
		}
	}
	
	//gun 2 = shotgun
	if (key_secondary) && timer_get("bullet_load2") <= 0 {
		if ammo_type2 > 0 {
			dd = instance_create_depth(x,y,depth,oBullet2);
			dd.direction = point_direction(x,y,mouse_x,mouse_y);		
			
			ee = instance_create_depth(x,y,depth,oBullet2);
			ee.direction = point_direction(x,y,mouse_x,mouse_y)+20+random(5);	
			
			ff = instance_create_depth(x,y,depth,oBullet2);
			ff.direction = point_direction(x,y,mouse_x,mouse_y)-20-random(5);	
			
			timer_set("bullet_load2",40);
			ScreenShake(1,1);
			ammo_type2 -=1; 
			audio_sound_gain(sn_DT,0.4,0);
			audio_sound_pitch(sn_DT,choose(0.8,0.85,0.9));
			audio_play_sound(sn_DT,3,0);
		}
	}
}
	
	
function PlayerAnimations() {
	//movement vars
	var move_hor = key_right - key_left;
	var move_ver = key_down - key_up; 
	var mouse_direction = point_direction(x,y,mouse_x,mouse_y); //gamepad support later
	
	//if standing still
	if (move_hor = 0 && move_ver = 0) {
		if mouse_direction < 90 or mouse_direction >= 270 {image_xscale = -1} else {image_xscale = 1}
		sprite_index = sMain_Character_left;
	}
	else {
		sprite_index = sMain_Character_walk;
		if move_hor < 0 image_xscale = 1 else image_xscale = -1;
	}
	
	//speed is consistent
	image_speed = 1;
}