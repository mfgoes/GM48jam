/// @description Insert description here
// You can write your code in this editor
draw_set_font(fSign);
draw_set_halign(fa_left);
//gm live 
if (live_call()) return live_result; 
draw_text(15,15,"coins " + string(oPlayer.coins)); 

//draw timer
draw_text(15,35,"boss countdown " + string(boss_timer)); 