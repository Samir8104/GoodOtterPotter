var rightKey = ord("D");
var leftKey  = ord("A");
var jumpKey  = keyboard_check_pressed(vk_space);
// Movement
if (keyboard_check(rightKey) && !place_meeting(x + player_speed, y, flr_Object) and state != PlayerStates.balancing) {
    hspd = player_speed;
    facing = 1; // face right
}
if (keyboard_check(leftKey) && !place_meeting(x - player_speed, y, flr_Object) and state != PlayerStates.balancing) {
    hspd = -player_speed;
    facing = -1; // face left
} 
if (!keyboard_check(rightKey) and !keyboard_check(leftKey) and state != PlayerStates.balancing) {
	hspd = 0;
}


plrSprite_Object.image_xscale = 0.6 * facing;


if (jumpKey && place_meeting(x, y+1, flr_Object) and state != PlayerStates.balancing) {
    vspd = -jump_power;
    plrSprite_Object.state = PlayerStates.jumping
}


vspd += gravity_amt;
if (vspd > max_fall) vspd = max_fall;

#region collision w/ walls and floors, also movement (!!!)
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
#endregion



// handle sprites/animations
if(plrSprite_Object.state != PlayerStates.balancing) {
	if (hspd == 0 && vspd == 0 and plrSprite_Object.state != PlayerStates.jumping){
		plrSprite_Object.state = PlayerStates.idle
	}
	if (hspd != 0 and plrSprite_Object.state != PlayerStates.jumping) {
		plrSprite_Object.state = PlayerStates.running
	}
	if (!place_meeting(x, y + 1, flr_Object) and vspd > 0) {
	    plrSprite_Object.state = PlayerStates.falling;
	}
}
