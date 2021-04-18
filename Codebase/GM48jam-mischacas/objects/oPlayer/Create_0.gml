/// @desc init player
#region Load basic character data
	hsp = 0;
	vsp = 0;
	current_walkspd = 0;
	
	//player stats
	hp = 3;
	shields = 0; //ignore this for now
	upgrades = 0;
	ammo_type1 = 10;
	ammo_type2 = 5;
	
	walkspd = 3;
	hascontrol = true;
	
	speedRoll = 5.0;
	distanceRoll = 170;
	facing_direction = 0; //the last walked in direction
		
	//weapon stuff
	current_weapon = 0; //0 = bow, 1 = regular
	gunkickx = 2;
	gunkicky = 0;
	flash = 0; 
	
	//items 
	coins = 0;
		
	//misc
	gamepad_on = false;
#endregion

#region player movement
	PlayerInput();
	state = PlayerStateFree;
#endregion

//Create essential objects
if !instance_exists(oGame) {
	instance_create_depth(x,y,depth,oGame);
}
