/// obj_DmgNumber Draw

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// text hover around one point
var reducedLength = angle_Length - 0.05;
var xx  = x + lengthdir_x(reducedLength, angle);
var yy  = y + lengthdir_y(angle_Length, angle);

var negativeAngle = angle - 180;
var xx2 = x + lengthdir_x(reducedLength, negativeAngle);
var yy2 = y + lengthdir_y(angle_Length, negativeAngle);

// shadow
draw_text_transformed_color(
    xx, yy, text,
    text_Size, text_Size, 0,
    textColor_Shadow, textColor_Shadow, textColor_Shadow, textColor_Shadow, 1
);

// lighter front text
draw_text_transformed_color(
    xx2, yy2, text,
    text_Size, text_Size, 0,
    textColor_Front, textColor_Front, textColor_Front, textColor_Front, 1
);
