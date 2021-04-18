/// @description Insert description here
// You can write your code in this editor
//gm live 
if (live_call()) return live_result; 

// Inherit the parent event
event_inherited();
timer_init("boss_camera");

if cam_pan_off = false {
	if summoned = true && alarm[0] = -1 && pan_camera = false {
		alarm[0] = 50;
		pan_camera = true;
	}
}