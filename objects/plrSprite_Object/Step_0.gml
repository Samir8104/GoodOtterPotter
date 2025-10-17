


if (state == PlayerStates.idle) {
 sprite_index = plr_idle
 
}
if (state == PlayerStates.running) {
 sprite_index = plr_run
}
if(state == PlayerStates.jumping) {
sprite_index = plr_jump
}
if(state == PlayerStates.falling) {
sprite_index = plr_fall
}
if(state == PlayerStates.balancing) {
	sprite_index = plr_balance
}

if (plr_Object.invulnerable) {
    // blink every 5 frames
    image_alpha = (current_time div 100) mod 2;
} else {
    image_alpha = 1;
}





if(instance_exists(plr_Object)) {
 x = plr_Object.x
 y = plr_Object.y


}