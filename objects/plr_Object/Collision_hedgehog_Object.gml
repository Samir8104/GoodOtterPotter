if (!invulnerable) {
    if (vspd > 0 && y < other.y) {
        with (other) instance_destroy();
        vspd = -6;
    } else {
        if (score > 0) {
            score -= 1;
            invulnerable = true;
            alarm[0] = room_speed * 0.5; // 0.5s i-frames

            with (ptry_Object) visible = true; // toggle UI safely
            show_debug_message("Breaking one pottery. score=" + string(score));
        } else {
            instance_destroy();
			room_restart()
            room_goto(lose_sc)
        }
    }
}
