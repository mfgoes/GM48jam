/// @description Insert description here
event_inherited();

// You can write your code in this editor
if (place_meeting(x,y, oPlayer)) {
	oPlayer.coins +=1; 
	instance_destroy(); 
}