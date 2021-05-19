/// @description bullet variables
damage = 1; //does 1 damage
spd = 5;
//explodes = false;
//splash = false; 
destroy_self = false;
collision_wall = true;
gun_flare = 2; //2 frames;

//randomize range
range_bullet = round(random_range(80,100));

//play sound if close enough to player
if instance_exists(oPlayer) {
	if distance_to_object(oPlayer) < 120 {
		audio_sound_gain(snBossBullet1,0.15,0);
		audio_sound_pitch(snBossBullet1,0.9);
		audio_play_sound(snBossBullet1,3,0);
	}
}