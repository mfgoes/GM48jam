/// @description enemy movement
//gm live 
if (live_call()) return live_result; 

//shoot at player 
timer_init("shoot");
timer_init("start_shooting");

timer_init("start_walk"); //every 60 frames, walk
timer_init("walk_length"); //walk for 20 frames 

if instance_exists(oPlayer) && start_shooting = 1 {
	if timer_get("shoot") <= 0 && !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0){
		timer_set("shoot",shoot_frequency+random(25));
		dd = instance_create_depth(x,y,depth-1,oEbullet);
		dd.direction = point_direction(x,y,oPlayer.x,oPlayer.y)+random_range(-20,20);
		dd.spd = random_range(1,1.5);
	}
}
else exit;

//walk around randomly
var walkspd = 0.5;
var x_forward = lengthdir_x(walkspd,direction);
var y_forward = lengthdir_y(walkspd,direction);

if timer_get("start_walk") <=0 {
	timer_set("walk_length",50+round(random(50)));
	timer_set("start_walk",round(50+random(80)));
	direction = choose(0,45,90,135,180,225,270,315,360);
	
	//smart collision, move away from wall
	if place_meeting (x+x_forward*3,y+y_forward*3,oWall) {direction +=180;}
}

if timer_get("walk_length") > 0 { //20/40
	if !place_meeting(x+x_forward,y+y_forward,oWall) {
	x += x_forward;
	y += y_forward;
	}
}



