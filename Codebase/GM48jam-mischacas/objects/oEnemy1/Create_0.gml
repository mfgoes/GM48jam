event_inherited();
//gm live 
if (live_call()) return live_result; 

hp = 2;
hp_max = hp;

sight_range = 70 //randomize later
shoot_frequency = 150;
start_shooting = 0;
alarm[0] = 50+random(100);

/*enum enemy_states { 
  patrol,
  approach,
  attack
}*/

current_state = enemy_states.patrol;
//extras
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking 

/*to do: enemy 1
-draw state var
-approach player when no walls in the way (slide to player seperate x + y vars)
-explode = attack. this changes instance to explosion

to do: enemy 2
-approach player when out of range
-shoot when in range. walk around randomly. (don't follow player)

*/