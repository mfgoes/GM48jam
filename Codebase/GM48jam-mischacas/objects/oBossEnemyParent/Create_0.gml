/// @description init boss 
//state enums for simple enemies
enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}

current_state = enemy_states.idle;
image_index = 0;
image_speed = 0;

hp = 2;
flash = 0;
walkspd = 0.6;
dmg_amount = 3;

//set boss phases here
summoned = 0; 
sprite_summon = s_boss_Slime_angry;

sight_range = 70 //randomize later
shoot_frequency = 80;
