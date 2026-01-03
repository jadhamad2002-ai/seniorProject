/// obj_camera Create
window_set_cursor(cr_none); // hide OS cursor [web:182]

// target to follow
target = Obj_Player;

// store camera and base size
cam = view_camera[0];

base_w = camera_get_view_width(cam);
base_h = camera_get_view_height(cam);

// start zoomed out (e.g. 1.8x)
zoom        = 1.8;
zoom_target = 1.8;
