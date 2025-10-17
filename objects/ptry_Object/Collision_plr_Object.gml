if(id.visible == true) {
	
score += 1;
if(score == 4){
	score = 0;
	GUI_Object.Pots += 1
}

visible = false
show_debug_message("Object going invis")
}

audio_play_sound(pottery_collection, 1, false);
instance_destroy()


