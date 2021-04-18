/// @description init specific variables
//gm live 
if (live_call()) return live_result; 
global.kills = 0;
global.killsthisroom = 0;

global.exp_points = 0;
global.exp_points_thisroom = 0;
global.debugmode = false; 
global.game_paused = false;
global.pause_bg = noone;
global.sound_volume = 1;

audio_master_gain(global.sound_volume);
global.game_paused = false;
global.boss_active = false;

boss_timer = 60; //60 seconds. 
timer_active = true;
