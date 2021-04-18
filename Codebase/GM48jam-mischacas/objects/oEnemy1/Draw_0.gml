/// @description Insert description here

//gm live 
//if (live_call()) return live_result; 
// Inherit the parent event
event_inherited();


//hp / hp_max = 1;
//
var percentagehp = (hp / hp_max)*10; // 0/0 = -5 1/2 = 5;  2/2 = 10; (multiplied by 10? 

//draw healthbar
draw_set_color(c_yellow);
draw_rectangle(x-5,y-10,x+percentagehp-5,y-9,0);
draw_set_color(c_white);
draw_set_font(fObjVariables);

draw_text(x+4,y-25,current_state);

//debug
if global.debugmode = true {
	draw_circle(x,y,sight_range,1);
}