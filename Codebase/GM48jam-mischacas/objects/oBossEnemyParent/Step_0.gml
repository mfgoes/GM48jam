/// @description summon boss

if global.boss_active = true && summoned = false {
	sprite_index = sprite_summon;
	summoned = true;
	ScreenShake(1,10);
}