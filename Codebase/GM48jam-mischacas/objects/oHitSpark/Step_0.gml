/// @description Insert description here
// You can write your code in this editor
if global.game_paused
{
	exit;
}

if round(image_index) = 3 {
	instance_destroy();
}