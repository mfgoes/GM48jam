// You can write your code in this editor
//gm live 
if (live_call()) return live_result;

var orange2 = make_colour_rgb(255, 170, 94);
var yellow1 = make_colour_rgb(255, 212, 163);
var blue1 = make_colour_rgb(84, 78, 104);
var blue2 = make_colour_rgb(32, 60, 86);

/*
timer_init("skew_light");
if timer_get("skew_light") <= 0 {
	skew_light= 0;
	timer_set("skew_light",80);
}
else {
	if timer_get("skew_light") <40
	skew_light+=0.5;
	else skew_light-=0.5;
}*/


draw_set_color(orange2);
draw_set_halign(fa_center);

draw_set_font(fObjVariables);
draw_set_color(yellow1);
draw_text( RES_W*RES_SCALE_HUD/2,190,"Demo Complete");
draw_text( RES_W*RES_SCALE_HUD/2,210,"Press ESC to exit. R to play again");

draw_set_color(blue1);
//draw_text( RES_W*RES_SCALE_HUD/2,300,"By Cas and Mischa");
draw_text( RES_W*RES_SCALE_HUD/2,320,"Gm48 Gamejam 2021. By Cas & Mischa");

draw_set_color(orange2);
draw_set_font(fTitleGothic);
draw_text( RES_W*RES_SCALE_HUD/2,RES_H*RES_SCALE/2-40,"Thanks for playing!");
//draw_text(15, RES_H*RES_SCALE_HUD-70,"ammo2 : " + string(oPlayer.ammo_type2));