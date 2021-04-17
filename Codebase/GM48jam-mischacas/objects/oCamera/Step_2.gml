//GMLive
if (live_call()) return live_result; 

//Upate camera destination
if (instance_exists(follow)) 
{
	//while aiming, follow mouse position slightly
	var pan_distance_weapon = 3; //move camera when aiming?
	//var pan_distance_weapon = clamp(point_distance(follow.x,follow.y,mouse_x,mouse_y),3,10); //max camera shift when focusing weapon

	xTo = follow.x+lengthdir_x(pan_distance_weapon,point_direction(follow.x,follow.y,mouse_x,mouse_y)); //Follow point from A (followX) to B (mouseX). Lenghtdir should be a fraction of distance of mouse to follow.x
	yTo = follow.y+lengthdir_y(pan_distance_weapon,point_direction(follow.x,follow.y,mouse_x,mouse_y));
	
}
x = clamp(x,view_w_half,room_width-view_w_half); //maintain room boundaries buff = extra space for screenshake
y = clamp(y,view_h_half,room_height-view_h_half);

x += (xTo - x) / cam_speed // / 8; //cam_speed;
y += (yTo - y) / cam_speed // / 8; //cam_speed; 


//Screenshake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,(shake_remain)-((1/shake_length))); //*shake_magnitude // shake magnitude increases when zooming out for consistency

var view_w = camera_get_view_width(cam); //zoom_speed = 0.25;
var view_h = camera_get_view_height(cam); //lerp from old view height to display height

camera_set_view_pos(cam,x-view_w/2,y-view_h/2); //set new position to include screenshake and zoom position

