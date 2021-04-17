/// @description summon boss

if global.boss_active = true && summoned = false {
	image_index = 1;
	summoned = true;
	ScreenShake(5,15);
}