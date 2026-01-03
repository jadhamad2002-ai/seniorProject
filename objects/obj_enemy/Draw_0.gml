// Draw event of obj_enemy

// Legs (face movement direction)
draw_sprite_ext(
    spr_ELegsWalk,
    image_index,
    x, y,
    image_xscale,
    image_yscale,
    leg_angle,   // legs use movement angle
    c_white,
    1
);

// Enemy body+gun — aim direction
draw_sprite_ext(
    enemy_body_sprite,
    image_index,
    x, y,
    image_xscale,
    image_yscale,
    image_angle_,   // body uses aim / attack angle
    c_white,
    1
);

// ===== DEBUG (unchanged) =====
if (Obj_Control.debug == true) {
    draw_set_alpha(0.4);
    draw_circle_colour(position_Start_X,position_Start_Y,3,c_orange,c_orange,0);
    draw_circle_colour(position_Target_X,position_Target_Y,3,c_red,c_red,0);
    draw_set_alpha(1);

    draw_set_alpha(0.1);
    draw_circle_colour(x,y,attackRange,c_red,c_red,0);
    draw_circle_colour(x,y,attackRangeBreak,c_blue,c_blue,0);
    draw_set_alpha(1);

    var lineLength = 100;
    var get_lineMiddle_X = x+ lengthdir_x(lineLength,image_angle_);
    var get_lineMiddle_Y = y+ lengthdir_y(lineLength,image_angle_);

    var angleDiff = ai_I_See_you_Angle;

    var get_lineAbove_X = x+ lengthdir_x(lineLength,image_angle_ - angleDiff);
    var get_lineAbove_Y = y+ lengthdir_y(lineLength,image_angle_ - angleDiff);

    var get_lineBelow_X = x+ lengthdir_x(lineLength,image_angle_ + angleDiff);
    var get_lineBelow_Y = y+ lengthdir_y(lineLength,image_angle_ + angleDiff);

    draw_line_width_color(x,y,get_lineMiddle_X,get_lineMiddle_Y,2,c_purple,c_purple);
    draw_line_width_color(x,y,get_lineAbove_X,get_lineAbove_Y,1,c_red,c_red);
    draw_line_width_color(x,y,get_lineBelow_X,get_lineBelow_Y,1,c_red,c_red);
}
