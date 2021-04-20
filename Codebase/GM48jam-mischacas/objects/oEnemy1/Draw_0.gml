/// @description Insert description here

//gm live 
//if (live_call()) return live_result; 
// Inherit the parent event
event_inherited();


//hp / hp_max = 1;
//
var percentagehp = (hp / hp_max)*10; // 0/0 = -5 1/2 = 5;  2/2 = 10; (multiplied by 10? 

//draw healthbar
var orange2 = make_colour_rgb(255, 170, 94);
draw_set_color(orange2);
draw_rectangle(x-5,y-10,x+percentagehp-5,y-9,0);
draw_set_color(c_white);
draw_set_font(fObjVariables);

//debug
if global.debugmode = true {
	draw_circle(x,y,sight_range,1);
}