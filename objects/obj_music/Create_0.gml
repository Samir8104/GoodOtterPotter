/// Create — music controller
persistent = true;

// Prevent duplicates if the room is re-entered
if (instance_number(obj_music) > 1) { instance_destroy(); exit; }

// Track + handle
global.music_track = soundtrack; // your song asset
global.music_id    = undefined;
