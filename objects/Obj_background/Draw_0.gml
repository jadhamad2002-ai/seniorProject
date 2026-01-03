 var grabCamera_X      = camera_get_view_x(view_camera[0]);
var grabCamera_Y      = camera_get_view_y(view_camera[0]);
var grabCamera_Width  = camera_get_view_width(view_camera[0]);
var grabCamera_Height = camera_get_view_height(view_camera[0]);

// === TIME & HUE ===
// Slow global time
time_bg += 0.02;

// Slow hue scroll
hue += 0.15;
if (hue >= 256) hue -= 256; // 0..255 range for HSV[web:112]

// === NEON PULSE USING SIN ===
// sin goes -1..1; remap to 0..1
var pulse = (sin(time_bg) + 1) * 0.5;

// Saturation/value ranges for top and bottom colors
// More saturation and brightness at pulse peaks
var sat1 = lerp(180, 240, pulse); // top
var val1 = lerp(120, 190, pulse);

var sat2 = lerp(140, 210, 1 - pulse); // bottom slightly opposite
var val2 = lerp( 90, 160, 1 - pulse);

// Shift second hue slightly for gradient
var hue2 = hue + 32;
if (hue2 >= 256) hue2 -= 256;

// Final colors
var color1 = make_color_hsv(hue,  sat1, val1);
var color2 = make_color_hsv(hue2, sat2, val2);

// Draw big vertical gradient around camera[web:118]
draw_rectangle_color(
    grabCamera_X - buffer_,
    grabCamera_Y - buffer_,
    grabCamera_X + grabCamera_Width  + buffer_,
    grabCamera_Y + grabCamera_Height + buffer_,
    color1, color1, color2, color2,
    false
);

// Expose hue to other objects (trees etc.)
global.background_hue = hue;



