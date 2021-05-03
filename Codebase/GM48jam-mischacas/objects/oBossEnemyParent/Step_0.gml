/// @description summon boss

if global.boss_active = true && summoned = false {
	sprite_index = sprite_summon;
	summoned = true;
	audio_sound_gain(snd_bossSpawn,0.2,0);
	audio_play_sound(snd_bossSpawn,10,0);
	ScreenShake(3,20);
}