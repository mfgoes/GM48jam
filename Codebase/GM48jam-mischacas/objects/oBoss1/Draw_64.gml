/// @description Insert description here
// You can write your code in this editor
//gm live 
if (live_call()) return live_result; 

var percentagehp = (hp / hp_max)*200; // 0/0 = -5 1/2 = 5;  2/2 = 10;
var RESWhalf = RES_W*RES_SCALE_HUD / 2;
var stroke_width = 5;

var bluebgr = make_colour_rgb(13, 43, 69);
var orange2 = make_colour_rgb(255, 170, 94);


if global.boss_active = true {
	//draw health bar
	draw_set_color(bluebgr); 
	draw_rectangle(RESWhalf-100-stroke_width,20-stroke_width,RESWhalf+percentagehp-100+stroke_width,45+stroke_width,0);
	
	draw_set_color(orange2); 
	draw_rectangle(RESWhalf-100,20,RESWhalf+percentagehp-100,45,0);
	draw_set_color(c_white);
	
	
	draw_text(x,y-30,pan_camera);
}

/*
var percentagehp = (hp / hp_max)*10; // 0/0 = -5 1/2 = 5;  2/2 = 10; (multiplied by 10? 

//draw healthbar
draw_set_color(c_yellow);
draw_rectangle(x-5,y-10,x+percentagehp-5,y-9,0);
*/