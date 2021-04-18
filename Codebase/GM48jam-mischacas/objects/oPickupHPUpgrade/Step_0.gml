/// @description Insert description here
event_inherited();

// You can write your code in this editor
if (place_meeting(x,y, oPlayer)) {
	oPlayer.hp +=1; 
	oPlayer.hp_max +=1;
	instance_destroy(); 
}