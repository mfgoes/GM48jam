/// @description Insert description here
// You can write your code in this editor
//Enable views
	view_enabled = true;
	view_visible[0] = true;
	cam = camera_create_view(0,0,RES_W,RES_H); 
	view_set_camera(0,cam);
	skew_light = 0;
	
	//Resize window & applicatiom surface
	window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE); 
	surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);
	display_set_gui_size(RES_W*RES_SCALE_HUD, RES_H*RES_SCALE_HUD);
	
	
	if (instance_exists(oCamera)) {
	with(oCamera) instance_destroy();
}

//ease in 
audio_play_sound(snd_healthGain,0,0);
audio_play_sound(sAmbient_dungeon,2,-1);