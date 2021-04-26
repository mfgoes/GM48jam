/// @description summon boss

if global.boss_active = true && summoned = false {
	sprite_index = sprite_summon;
	summoned = true;
	audio_play_sound(snd_bossSpawn,10,0);
	ScreenShake(1,10);
}