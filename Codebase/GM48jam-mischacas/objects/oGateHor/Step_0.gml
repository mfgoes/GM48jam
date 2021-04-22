/// @description check if keys aqquired
if instance_exists(oPlayer) {
	if oPlayer.keys = keys_needed {
		instance_change(oGateHorUnlocked,1)
		ScreenShake(2,10);
	}
}