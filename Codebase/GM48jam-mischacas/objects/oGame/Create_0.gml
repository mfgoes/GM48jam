/// @description init specific variables
//gm live 
if (live_call()) return live_result; 

global.game_paused = false;
global.boss_active = false;

boss_timer = 5; //60 seconds. 
timer_active = true;
