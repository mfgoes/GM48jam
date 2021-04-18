/// @description Insert description here
// You can write your code in this editor
//gm live 
//if (live_call()) return live_result; 

if instance_exists(oPlayer) {
	draw_set_font(fSign);
	draw_set_halign(fa_left);
	draw_text(15,15,"coins " + string(oPlayer.coins)); 

	//draw timer
	draw_text(15,35,"boss countdown " + string(boss_timer)); 
	draw_text(15, RES_H*RES_SCALE_HUD-40,"hp: " + string(oPlayer.hp)); 
	draw_text(75, RES_H*RES_SCALE_HUD-40,"shield: " + string(oPlayer.shields)); 
	draw_text(15, RES_H*RES_SCALE_HUD-100,"ammo1 : " + string(oPlayer.ammo_type1)); 
	draw_text(15, RES_H*RES_SCALE_HUD-70,"ammo2 : " + string(oPlayer.ammo_type2));
	draw_set_halign(fa_right);
	draw_text(RES_W*RES_SCALE_HUD-15, RES_H*RES_SCALE_HUD-70,"upgrades : " + string(oPlayer.upgrades));
}
else exit;
