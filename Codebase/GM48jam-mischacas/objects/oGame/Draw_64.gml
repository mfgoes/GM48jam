/// @description Insert description here
// You can write your code in this editor
draw_set_font(fSign);
draw_set_halign(fa_left);
//gm live 
if (live_call()) return live_result; 
draw_text(15,15,"coins " + string(oPlayer.coins)); 

//draw timer
draw_text(15,35,"boss countdown " + string(boss_timer)); 

//draw player UI elements
/*
	//player stats
	hp = 1;
	shields = 0;
	upgrades = 0;
	ammo_type1 = 10;
	ammo_type2 = 5;
*/
draw_text(15, RES_H*RES_SCALE_HUD-40,"hp: " + string(oPlayer.hp)); 
draw_text(75, RES_H*RES_SCALE_HUD-40,"shield: " + string(oPlayer.shields)); 


draw_text(15, RES_H*RES_SCALE_HUD-100,"ammo1 : " + string(oPlayer.ammo_type1)); 
draw_text(15, RES_H*RES_SCALE_HUD-70,"ammo2 : " + string(oPlayer.ammo_type2));
draw_set_halign(fa_right);
draw_text(RES_W*RES_SCALE_HUD-15, RES_H*RES_SCALE_HUD-70,"upgrades : " + string(oPlayer.upgrades));
