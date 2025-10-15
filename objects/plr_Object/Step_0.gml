var rightKey = ord("D");
var leftKey  =ord("A");
var jumpKey  = keyboard_check_pressed(vk_space);
var facing = 1;
hspd = 0;

// Input without collision checks
if (keyboard_check(rightKey)){
    hspd = player_speed;
    state = PlayerStates.running;
    facing = 1;
	show_debug_message("Heading Right, hspd set to: " + string(hspd))
}
if (keyboard_check(leftKey)){
    hspd = -player_speed;
    state = PlayerStates.running;
    show_debug_message("Heading Left, hspd set to: " + string(hspd))
	facing = -1;
}

if (!keyboard_check(rightKey) && !keyboard_check(leftKey) && place_meeting(x, y+1, flr_Object)) { 
    state = PlayerStates.idle;
	hspd = 0;
}

if (jumpKey && place_meeting(x, y+1, flr_Object)) {
	state = PlayerStates.jumping
    vspd = -jump_power;
}
vspd += gravity_amt;
if (vspd > max_fall) vspd = max_fall;

image_xscale = 0.6 * facing;

// Check collision BEFORE moving
show_debug_message("Before collision check - hspd: " + string(hspd) + " | Collision at x+" + string(hspd) + ": " + string(instance_place(x + hspd, y, flr_Object) != noone))
if (instance_place(x + hspd, y, flr_Object)) {
    show_debug_message("COLLISION DETECTED! Stopping movement")
    hspd = 0;
}
show_debug_message("Final hspd before moving: " + string(hspd))
x += hspd;

if (place_meeting(x, y + vspd, flr_Object)) {
    while (!place_meeting(x, y + sign(vspd), flr_Object)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

if (state == PlayerStates.idle) {
	sprite_index = plr_idle;
} else if (state == PlayerStates.running) {
	sprite_index = plr_run;
}