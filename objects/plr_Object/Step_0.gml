var rightKey = ord("D");
var leftKey  = ord("A");
var jumpKey  = keyboard_check_pressed(vk_space);
var facing = 1;
// Movement
if (keyboard_check(rightKey) && !place_meeting(x + player_speed, y, flr_Object) and state != PlayerStates.balancing) {
    x += player_speed;
    facing = 1; // face right
}
if (keyboard_check(leftKey) && !place_meeting(x - player_speed, y, flr_Object) and state != PlayerStates.balancing) {
    x -= player_speed;
    facing = -1; // face left
}

// Apply the facing every frame
image_xscale = 0.6 * facing;


if (jumpKey && place_meeting(x, y+1, flr_Object) and state != PlayerStates.balancing) {
    vspd = -jump_power;
}


vspd += gravity_amt;
if (vspd > max_fall) vspd = max_fall;


if (place_meeting(x + hspd, y, flr_Object)) {
    while (!place_meeting(x + sign(hspd), y, flr_Object)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;


if (place_meeting(x, y + vspd, flr_Object)) {
    while (!place_meeting(x, y + sign(vspd), flr_Object)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

if (hspd == 0 && vspd == 0 and state != PlayerStates.balancing){
	sprite_index = plr_idle;

}