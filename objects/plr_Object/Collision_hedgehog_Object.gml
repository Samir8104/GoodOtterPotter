if (vspd > 0 && y < other.y) {
    with (other) {
        instance_destroy(); 
    }

    vspd = -6;  
} else {
    instance_destroy()
	room_restart()
}