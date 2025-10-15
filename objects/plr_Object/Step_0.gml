
var rightKey = ord("D");
var leftKey  =ord("A");
var jumpKey  = keyboard_check_pressed(vk_space);
var facing = 1;
hspd = 0;






if (keyboard_check(rightKey)){
    hspd = player_speed;
    state = PlayerStates.running;
    facing = 1;
}
if (keyboard_check(leftKey)){
    hspd = -player_speed;
    state = PlayerStates.running;
    facing = -1;
}


if (!keyboard_check(rightKey) && !keyboard_check(leftKey) && place_meeting(x, y+1, flr_Object)) {
    state = PlayerStates.idle;
	hspd = 0;
}


image_xscale = 0.6 * facing;


if (jumpKey && place_meeting(x, y+1, flr_Object)) {
	state = PlayerStates.jumping
    vspd = -jump_power;
}


vspd += gravity_amt;
if (vspd > max_fall) vspd = max_fall;

show_debug_message(hspd)

x+=hspd;



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
	show_debug_message("Run animation should be playing");
}