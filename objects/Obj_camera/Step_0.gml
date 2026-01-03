/// obj_camera Step
/// Obj_Control Step

cursor_sprite = spr_cursor; // your cursor sprite

if (!instance_exists(target)) exit;

// === ZOOM INPUT (MOUSE WHEEL, REVERSED AS YOU WANT) ===
// wheel down = zoom OUT, wheel up = zoom IN
// mouse_wheel_down() is 1 when scrolling down, mouse_wheel_up() is 1 when scrolling up [web:151][web:154]
var wheel = mouse_wheel_down() - mouse_wheel_up(); // down -> +1, up -> -1

var zoom_step = 0.1;

// positive wheel increases zoom (zoom out), negative decreases (zoom in)
zoom_target += wheel * zoom_step;

// clamp target zoom
zoom_target = clamp(zoom_target, 0.5, 3);

// smooth actual zoom toward target
var zoom_smooth = 0.2;
zoom = lerp(zoom, zoom_target, zoom_smooth);

// === COMPUTE VIEW SIZE FROM ZOOM ===
var new_w = base_w * zoom;
var new_h = base_h * zoom;

camera_set_view_size(cam, new_w, new_h);

// === FOLLOW TARGET WITH CLAMPING ===
var cameraX = target.x - new_w * 0.5;
var cameraY = target.y - new_h * 0.5;

cameraX = clamp(cameraX, 0, room_width  - new_w);
cameraY = clamp(cameraY, 0, room_height - new_h);

// optional: round to avoid subpixel jitter
cameraX = round(cameraX);
cameraY = round(cameraY);

var cur_x = camera_get_view_x(cam);
var cur_y = camera_get_view_y(cam);
var follow_smooth = 0.1;

camera_set_view_pos(
    cam,
    lerp(cur_x, cameraX, follow_smooth),
    lerp(cur_y, cameraY, follow_smooth)
);
