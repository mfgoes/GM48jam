/// @description Insert description here
// You can write your code in this editor
//gm live 
if (live_call()) return live_result; 

// Inherit the parent event
event_inherited();
timer_init("boss_camera");
//shoot at player 
timer_init("shoot");
timer_init("shoot360");
timer_init("shoot360B");
timer_init("start_shooting");
var shoot_angle = 0;

#region camera + effects
	if cam_pan_off = false {
		if summoned = true && alarm[0] = -1 && pan_camera = false {
			alarm[0] = 100;
			pan_camera = true;
		}
	}
#endregion
	
#region attack types
if (summoned = true) && instance_exists(oPlayer) {

//animation
if oPlayer.x < x image_xscale = 1; else image_xscale = -1; 

//take damage
if (hp <= 0) {
	ScreenShake(2,30);
	repeat(5)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,y,"Instances",oDust)) {
			vsp = -0.1; 
			hsp = random_range(-2,2)
			image_xscale = choose (3,-3);
			image_yscale = choose (3, -3);
		}	
		dd = instance_create_depth(x,y,depth,oHitSpark);
		dd.image_xscale = 3; dd.image_yscale = 3;
	}
	instance_destroy();
	audio_play_sound(snd_enemy_exploding,0,0);
	oGame.level_complete = true;
}
image_alpha = 1;	

//do damage
switch (wave){
	case 1: //simple attack
	{
	if instance_exists(oPlayer) { //&& start_shooting = 1
		if timer_get("shoot") <= 0 && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0){
			timer_set("shoot",shoot_frequency+random(25));
			dd = instance_create_depth(x,y,depth-1,oEbulletFollow);
			dd.direction = point_direction(x,y,oPlayer.x,oPlayer.y)+random_range(-25,25);
			dd.spd = random_range(1.2,1.8);
			audio_play_sound(snMissile1,0,0);
			}
		}
	else exit;
	}
	break;
	case 2: //attack and follow
	{
		if instance_exists(oPlayer) { //&& start_shooting = 1
		if timer_get("shoot360") <= 0 && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0){
			timer_set("shoot360",shoot_frequency*2+random(45));
			audio_sound_pitch(snMissile1,0.8);
			audio_play_sound(snMissile1,0,0);
			ScreenShake(3,3);
			
			repeat(8) {
				shoot_angle+=45; 
				dd = instance_create_depth(x,y,depth-1,oEbulletFollow);
				dd.direction = point_direction(x,y,oPlayer.x,oPlayer.y)+shoot_angle;
				dd.spd = random_range(1.2,1.8);
			}
			}
		if timer_get("shoot") <= 0 && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0){
			timer_set("shoot",shoot_frequency+30+random(25));
			dd = instance_create_depth(x,y,depth-1,oEbulletFollow);
			dd.direction = point_direction(x,y,oPlayer.x,oPlayer.y)+random_range(-25,25);
			dd.spd = random_range(1.2,1.8);
			audio_sound_pitch(snMissile1,1);
			audio_play_sound(snMissile1,0,0);
			}
		}
		
	}
	break;
	case 3: //attack, follow and spawn enemies
	{
		if instance_exists(oPlayer) { //&& start_shooting = 1
		if timer_get("shoot360") <= 0 && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0){
			timer_set("shoot360",shoot_frequency*3);
			audio_sound_pitch(snMissile1,0.8);
			audio_play_sound(snMissile1,0,0);
			
			repeat(16) {
				shoot_angle+=45/2; 
				dd = instance_create_depth(x,y,depth-1,oEbulletFollow);
				dd.direction = point_direction(x,y,oPlayer.x,oPlayer.y)+shoot_angle;
				dd.spd = random_range(1.3,2);
			}
		}
		
		//easy circle attack
		if timer_get("shoot360B") <= 0 && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0){
			timer_set("shoot360B",shoot_frequency*4);
			audio_sound_pitch(snMissile1,0.8);
			audio_play_sound(snMissile1,0,0);
			
			repeat(8) {
				shoot_angle+=45; 
				dd = instance_create_depth(x,y,depth-1,oEbulletFollow);
				dd.direction = point_direction(x,y,oPlayer.x,oPlayer.y)+shoot_angle;
				dd.spd = random_range(1,1.2);
			}
		}
		
		
		if timer_get("shoot") <= 0 && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0){
			timer_set("shoot",shoot_frequency+random(5));
			dd = instance_create_depth(x,y,depth-1,oEbulletFollow);
			dd.direction = point_direction(x,y,oPlayer.x,oPlayer.y)+random_range(-25,25);
			dd.spd = random_range(1.2,1.8);
			audio_sound_pitch(snMissile1,1);
			audio_play_sound(snMissile1,0,0);
			}
		}	
	}
	break;
}

#region move towards player 

	if instance_exists(oPlayer) && wave > 1 { //check if should follow player
		if distance_to_object(oPlayer) <=sight_range && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0) && distance_to_object(oPlayer) > 2 {
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
		//image_speed = 0;
	}
	}
#endregion

//set attack phase
var percentagehp = (hp / hp_max)*100;
if percentagehp < 40 wave = 3;
else if percentagehp < 80  wave = 2;
else wave = 1;

}
else 
image_alpha = 0.3; //make it clear that you can't attack it yet. 

#endregion

