/// obj_DmgNumber Create

// score value passed from enemy (default if not set)
if (!variable_instance_exists(id, "value")) value = 400;

// starting text
text = "+" + string(value) + "PTS";

// movement
moveY = 0.1;

// rotation
angle        = 0;
angle_Add    = 3;
angle_Length = 0.6;

// colour shifting
textColor_Front_Sat = 100;
textColor_Front_Lum = 240;

textColor_Shadow_Sat = 100;
textColor_Shadow_Lum = 54;

textColor_Hue_Add   = -0.5;
textColor_Hue_Start = 336;
textColor_Hue_End   = 190;
textColor_Hue       = textColor_Hue_Start;

// initialise colours so Draw has them from frame 1
textColor_Front  = make_color_hsv(textColor_Hue, textColor_Front_Sat , textColor_Front_Lum);
textColor_Shadow = make_color_hsv(textColor_Hue, textColor_Shadow_Sat, textColor_Shadow_Lum);

// state machine
state         = "pop in";
text_Size     = 0;
text_Size_Add = 0.05;
text_Size_Max = 0.5;
