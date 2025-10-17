/// Room Start — start in homeRoom, stop on win/lose

// Start the song when entering homeRoom
if (room == homeRoom) {
    if (global.music_id == undefined || !audio_is_playing(global.music_id)) {
        global.music_id = audio_play_sound(global.music_track, 0, true); // loop
    }
}

// Stop the song on Game Over or Win screens
if (room == lose_sc || room == win_sc) {
    if (global.music_id != undefined) {
        audio_stop_sound(global.music_id);
        global.music_id = undefined;
    }
}
