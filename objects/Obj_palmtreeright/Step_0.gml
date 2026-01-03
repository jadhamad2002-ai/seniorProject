image_xscale += scale_up;
image_yscale += scale_up;
speed += speedup;

// Brighter, glowing neon trees synced to background hue
image_blend = make_color_hsv(global.background_hue, 240, 220);
image_angle = Obj_Menue.wiggle;