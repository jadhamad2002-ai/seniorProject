/// obj_DmgNumber Step

// move up and rotate
angle += angle_Add;
y -= moveY;

// colour shift
textColor_Hue += textColor_Hue_Add;
textColor_Front  = make_color_hsv(textColor_Hue, textColor_Front_Sat , textColor_Front_Lum);
textColor_Shadow = make_color_hsv(textColor_Hue, textColor_Shadow_Sat, textColor_Shadow_Lum);

// state machine
if (state == "pop in") {
    text_Size += text_Size_Add;
    if (text_Size >= text_Size_Max) state = "idle";
}

if (state == "idle") {
    if (textColor_Hue <= (textColor_Hue_End - 15)) state = "pop out";
}

if (state == "pop out") {
    text_Size -= text_Size_Add;
    if (text_Size <= 0) instance_destroy();
}

// final text: ONLY points now (timer is handled by Obj_Control)
text = "+" + string(value) + "PTS";
