

if(beam_Object.touched == false) {
	beam_Object.minigameActive = true
	state = PlayerStates.balancing
	x = beam_Object.x	
	y = beam_Object.y - 150
	beam_Object.touched = true
	show_debug_message("Just touched beam")
	
	instance_create_layer(x, y + 300, "instances", dangerBar_Object)
	dangerBar_Object.image_xscale = 3
	dangerBar_Object.image_yscale = 0.5
	
	instance_create_layer(x, y + 300, "Instances2", successBar_Object)
	successBar_Object.image_yscale = 0.25
	
	instance_create_layer(x, y + 350, "instances", arrow_Object)
	arrow_Object.image_xscale = 0.5
	arrow_Object.image_yscale = 0.5
}

