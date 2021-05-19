/// @description parent draw event
draw_self();
if gun_flare > 0 {
	draw_sprite(sBullet1,0,xstart,ystart);
	gun_flare-=1;
}