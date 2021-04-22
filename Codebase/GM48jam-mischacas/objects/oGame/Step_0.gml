/// @description set timer
timer_init("boss_timer");
timer_init("spawn_boss");

//enemy waves
timer_init("enemy_wave1");
timer_init("enemy_wave2");
timer_init("enemy_wave3");

if timer_get("boss_timer") <= 0 && boss_timer > 0 {
	timer_set("boss_timer",room_speed)
	boss_timer-=1;
	}

if boss_timer = 0 && timer_active = true { // 
	timer_active = false;
	global.boss_active = true;
	
	//destroy all items
	with (oPickupParent) instance_change(oPoofedObject,1);
	
	//init screenshake, etc. 
	ScreenShake(1,20);
}