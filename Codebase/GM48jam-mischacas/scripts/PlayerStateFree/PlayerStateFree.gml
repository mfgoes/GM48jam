// Player IDLE, WALK, JUMP
function PlayerStateFree(){
	
#region walking
	
	//Slow down while shooting
	var slowwalk = 0.5; 
	current_walkspd = 3;
	if current_weapon != 0 && mouse_check_button(mb_left) = true {
	slowwalk = 0.5;
	} else slowwalk = 1;
	
	//accelerate
	var move_hor = key_right - key_left;
	var move_ver = key_down - key_up; 
	
	hsp = (move_hor * current_walkspd);
	vsp = (move_ver * current_walkspd);
	
#endregion
}