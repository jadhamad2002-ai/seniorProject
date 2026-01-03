/// Obj_Player Draw

// legs
draw_sprite_ext(
    spr_P_legs,
    floor(walk_Frame),
    x, y,
    image_xscale, image_yscale,
    move_dir,
    c_white, 1
);

// full body + weapon
draw_sprite_ext(
    sprite_index,
    image_index,
    x, y,
    image_xscale, image_yscale,
    image_angle_,
    c_white, 1
);

