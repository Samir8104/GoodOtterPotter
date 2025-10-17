// Player Variables
player_speed = 13;   
jump_power   = 18;  
gravity_amt  = 0.6; 
max_fall     = 12;  
hspd = 0;
vspd = 0;

state = 0;

enum PlayerStates {
 idle = 0,
 running = 1,
 jumping = 2,
 falling = 3,
 balancing = 4
}

image_xscale = 0.6
image_yscale = 0.45
