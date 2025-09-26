var rightKey = ord("D");
var leftKey = ord("A");
var jumpKey = vk_space;

if (keyboard_check(leftKey)) {
    hspd = -spd;
}

if (keyboard_check(rightKey)) {
    hspd = spd;
}

if (place_meeting(x, y+1, flr_Object)) {
    vspd = 0;
    if (keyboard_check_pressed(jumpKey)) {
        vspd = -jspd;
    }
} else {
    if (vspd < 10) {
        vspd += grav;
    }
}

if ((!keyboard_check(rightKey) && !keyboard_check(leftKey)) ||
    (keyboard_check(rightKey) && keyboard_check(leftKey))) {
    hspd = 0;
}

x += hspd;
y += vspd;
