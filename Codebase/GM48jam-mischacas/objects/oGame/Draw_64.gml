/// @description Insert description here
// You can write your code in this editor
//gm live 
if (live_call()) return live_result; 

if instance_exists(oPlayer) {
	draw_set_font(fSign);
	draw_set_halign(fa_left);
	
	//boss related UI
	if boss_timer > 0 {
	draw_text(15,35,"boss countdown " + string(boss_timer)); 
	} //else draw in boss draw event
	
	draw_text(15, 40,"hp: " + string(oPlayer.hp)+ "/"+string(oPlayer.hp_max)); 
	draw_text(15, RES_H*RES_SCALE_HUD-100,"ammo1 : " + string(oPlayer.ammo_type1)); 
	draw_text(15, RES_H*RES_SCALE_HUD-70,"ammo2 : " + string(oPlayer.ammo_type2));
	draw_set_halign(fa_right);
	draw_text(RES_W*RES_SCALE_HUD-15, RES_H*RES_SCALE_HUD-70,"keys : " + string(oPlayer.coins));
	
	//debug
	//draw_text(60,80, point_direction(oPlayer.x,oPlayer.y,mouse_x,mouse_y));
}
else exit;
