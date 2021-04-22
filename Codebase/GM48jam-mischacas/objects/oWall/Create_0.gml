/// @description create half wall if space below(auto generate later)
if !place_meeting(x,y+sprite_height,oWall)
	instance_create_depth(x,y+16,depth,oWallHalfAuto);