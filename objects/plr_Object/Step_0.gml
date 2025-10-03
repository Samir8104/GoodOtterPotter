var rightKey = keyboard_check(ord("D"));
var leftKey  = keyboard_check(ord("A"));
var jumpKey  = keyboard_check_pressed(vk_space);

if (keyboard_check(rightKey) && !place_meeting(x + player_speed, y, flr_Object)) {
    x += player_speed;
}
if (keyboard_check(leftKey) && !place_meeting(x - player_speed, y, flr_Object)) {
    x -= player_speed;
}

// Jump
if (jumpKey && place_meeting(x, y+1, flr_Object)) {
    vspd = -jump_power;
}

// Gravity
vspd += gravity_amt;
if (vspd > max_fall) vspd = max_fall;

// Horizontal Collision
if (place_meeting(x + hspd, y, flr_Object)) {
    while (!place_meeting(x + sign(hspd), y, flr_Object)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

// Vertical Collision
if (place_meeting(x, y + vspd, flr_Object)) {
    while (!place_meeting(x, y + sign(vspd), flr_Object)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;
