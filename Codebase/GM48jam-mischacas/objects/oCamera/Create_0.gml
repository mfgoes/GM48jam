/// @description Set up Camera
//GMLive
//if (live_call()) return live_result; 

#region set up resolution macros
	#macro SAVEFILE "Save.sav"
	#macro RES_W 144
	#macro RES_H 96
	#macro RES_SCALE 3 //how much to scale the pixel art
	#macro RES_SCALE_HUD 3 //how much to scale the pixel art
	#macro RES_RATIO RES_H/RES_W
	#macro CAM_SMOOTH 0.1
#endregion

#region setup view basics
	//Enable views
	view_enabled = true;
	view_visible[0] = true;
	cam = camera_create_view(0,0,RES_W,RES_H); 
	view_set_camera(0,cam);
	
	//Resize window & applicatiom surface
	window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE); 
	surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);
	display_set_gui_size(RES_W*RES_SCALE_HUD, RES_H*RES_SCALE_HUD);

	//center window
	var display_width  = display_get_width();
	var display_height = display_get_height();
	key_fullscreen     = keyboard_check_pressed(vk_f1); 
	
	window_width = RES_W * RES_SCALE;
	window_height = RES_H * RES_SCALE;
	//window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2); //BRING THIS BACK LATER

	//"ideal width" -> Remove this later
	iw = RES_W*RES_SCALE; //display_width; //use these to fit the screen ratios. ie for browsers
	ih = RES_H*RES_SCALE; //display_height;
	//Mouse previous
	mouse_x_previous = device_mouse_x_to_gui(0);
	mouse_y_previous = device_mouse_y_to_gui(0);
#endregion

//reincluded code
if instance_exists(oPlayer) follow = oPlayer;
else follow = self;
camera_set_view_target(cam,follow);

//Starting camera position (room start)
if (instance_exists(follow)) {
	x = follow.x; y = follow.y; 
}
alarm[0] = 30; //replace with timer later

cam_speed = 4; //higher = =slower
zoom_speed = 0.5; //higher is faster?
start_zoom = 0.05; //zoom level at start of level
zoom = 0.55; //zoom level adjusted through scroll
weapon_zoom = 0; //zoom level affected by weapon


#region camera setup variables (lessen later)
	xTo = xstart;
	yTo = ystart;
	camDist = 0; //move to 90 later
	camDistFoc = -200; //focused view
	camDistFar = camDist;
	camDistRaw = 0;
	camFov = 0;
	//camFocused = false; //allow switching between zoom in + zoom out later
	camW = camera_get_view_width(cam);
	camH = camera_get_view_height(cam); 


	/// @description Set up Camera
	cam = view_camera[0];
	view_w_half = camera_get_view_width(cam)*0.5;
	view_h_half = camera_get_view_height(cam)*0.5;

	//screenshake
	shake_length = 0;
	shake_magnitude = 6;
	shake_remain = 2;
	buff = 0; //??? room clipping / boundaries for camera
#endregion