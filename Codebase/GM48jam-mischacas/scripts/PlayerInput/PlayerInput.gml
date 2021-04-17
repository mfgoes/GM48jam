// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerInput(){
	if (hascontrol)
	{
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0,gp_padl);
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0,gp_padr);
		key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check(0,gp_face2);
		key_down = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(0,gp_padd);
		key_up = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(0,gp_padu);
		
		key_equip = keyboard_check(ord("E")) || gamepad_button_check(0,gp_face4);
		key_pausegame = keyboard_check(vk_escape) || gamepad_button_check(0,gp_start);
		
		key_primary = mouse_check_button(mb_left)		|| gamepad_button_check(0,gp_shoulderr);	//Melee attack
		key_secondary = mouse_check_button(mb_right)	|| gamepad_button_check(0,gp_shoulderr);	//Melee attack
		key_roll =  keyboard_check_pressed(ord("F"))	|| gamepad_button_check(0,gp_face2);		//Evade
	}
}