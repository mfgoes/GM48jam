/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,1,1,direction,c_white,1);

if gun_flare > 0 {
	draw_sprite(sBullet1,0,xstart,ystart);
	gun_flare-=1;
}