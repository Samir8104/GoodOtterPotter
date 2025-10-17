
if (state == PlayerStates.idle) {
 sprite_index = plr_idle
}
if (state == PlayerStates.running) {
 sprite_index = plr_run
}
if(state == PlayerStates.jumping) {
sprite_index = plr_jump
show_debug_message("JUMPING!")
}







if(instance_exists(plr_Object)) {
 x = plr_Object.x
 y = plr_Object.y


}