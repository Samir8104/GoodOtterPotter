// Player Variables
player_speed = 13;   // Horizontal movement speed
jump_power   = 18;  // Jump strength
gravity_amt  = 0.6; // Gravity strength
max_fall     = 12;  // Terminal velocity
hspd = 0;
vspd = 0;
state = 0;
facing = 1
enum PlayerStates {
 idle = 0,
 running = 1,
 jumping = 2,
 falling = 3,
 balancing = 4
}

image_xscale = 0.85
image_yscale = 0.65


