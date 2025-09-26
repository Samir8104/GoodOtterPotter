cam = view_camera[0];
follow = plr_Object; // Camera can follow other objects too, so if we want to do a cutscene with an enemy we can :)


var w = camera_get_view_width(cam);
var h = camera_get_view_height(cam);

// The scaler is the zoom amount of the camera
camera_set_view_size(cam, w * 1.35, h * 1.35);


view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart;
yTo = ystart;
