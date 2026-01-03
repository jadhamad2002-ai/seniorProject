/// obj_Menue Draw

grabCamera_Width  = camera_get_view_width(view_camera[0]) / 2;
grabCamera_Height = camera_get_view_height(view_camera[0]) / 2;

// how much to push everything down
var y_offset = 80; // increase if you want it lower

// ===== BIG LOGO =====
draw_set_font(Fontlogo);
draw_set_halign(fa_center);

var base_x = grabCamera_Width;
var base_y = grabCamera_Height + logo_y_offset;

// move logo down by 40 pixels (tweak this value)
var logo_extra_y = 140;
base_y += logo_extra_y;

var offset_x = dcos(logo_angle) * logo_radius_x;
var offset_y = dsin(logo_angle) * logo_radius_y;

base_x += offset_x;
base_y += offset_y;

// logo shadow
draw_text_transformed_color(
    base_x + 6, base_y + 6,
    logo_text,
    logo_scale, logo_scale, 0,
    c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia,
    1
);

// logo main teal
var teal_col = make_color_rgb(0, 255, 200);
draw_text_transformed_color(
    base_x, base_y,
    logo_text,
    logo_scale, logo_scale, 0,
    teal_col, teal_col, teal_col, teal_col,
    1
);

// high score color
var hs_teal = make_color_rgb(0, 255, 200);



// ===== HIGH SCORE BOTTOM-RIGHT =====
var gui_w = camera_get_view_width(view_camera[0]);
var gui_h = camera_get_view_height(view_camera[0]);

draw_set_font(Fontmenue);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

var hs_shadow = c_black;
var hs_teal   = make_color_rgb(0, 255, 200);

var hx = gui_w - 24;
var hy = gui_h - 24;

var hs_val  = global.highscore;
var hs_text = "HIGH SCORE: " + string(hs_val);

// shadow
draw_set_color(hs_shadow);
draw_text(hx + 1, hy + 1, hs_text);

// main
draw_set_color(hs_teal);
draw_text(hx, hy, hs_text);

// ===== MENU TEXT =====
draw_set_font(Fontmenue);
draw_set_halign(fa_center);

var line1 = text_1;
var line2 = text_2;
var line3 = text_3;
var line4 = text_4;
var line5 = text_5;

if (menu_mode == "options") {
    line1 = text_1 + "  " + string(round(global.master_volume * 100)) + "%";
    line2 = text_2 + "  " + string(round(global.music_volume  * 100)) + "%";
    line3 = text_3 + "  " + string(round(global.sfx_volume    * 100)) + "%";
}

var lines = [line1,line2,line3,line4,line5];
var posys = [posy_1,posy_2,posy_3,posy_4,posy_5];

for (var i = 0; i < 5; i++) {
    var y_row = grabCamera_Height + posys[i] + y_offset;

    draw_text_transformed_color(
        grabCamera_Width, y_row + 2,
        lines[i],
        textSize, textSize, wiggle,
        colorShadow,colorShadow,colorShadow,colorShadow,1
    );
    draw_text_transformed_color(
        grabCamera_Width, y_row,
        lines[i],
        textSize, textSize, wiggle,
        colorNorm1,colorNorm1,colorNorm1,colorNorm1,1
    );
    draw_text_transformed_color(
        grabCamera_Width - 2, y_row - 2,
        lines[i],
        textSize, textSize, wiggle,
        colorAnimate,colorAnimate,colorAnimate,colorAnimate,blink
    );
}

// ===== SELECTED HIGHLIGHT =====
var posY_Selected = posy_1;
var text_Selected = line1;

switch (selected) {
    case 1: posY_Selected = posy_1; text_Selected = line1; break;
    case 2: posY_Selected = posy_2; text_Selected = line2; break;
    case 3: posY_Selected = posy_3; text_Selected = line3; break;
    case 4: posY_Selected = posy_4; text_Selected = line4; break;
    case 5: posY_Selected = posy_5; text_Selected = line5; break;
}

if (menu_mode == "controls") {
    posY_Selected = posy_5;
    text_Selected = line5;
}

for (var j = 0; j < draw_Extra; j++) {
    var y_sel = grabCamera_Height + posY_Selected + y_offset;

    draw_text_transformed_color(
        grabCamera_Width + j,   y_sel + 2,
        text_Selected,
        textSize, textSize, wiggle,
        colorShadow,colorShadow,colorShadow,colorShadow,1
    );
    draw_text_transformed_color(
        grabCamera_Width + j,   y_sel,
        text_Selected,
        textSize, textSize, wiggle,
        colorActive,colorActive,colorActive,colorActive,1
    );
    draw_text_transformed_color(
        grabCamera_Width - 2 + j, y_sel - 2,
        text_Selected,
        textSize, textSize, wiggle,
        colorAnimate,colorAnimate,colorAnimate,colorAnimate,blink
    );
}

// ===== CONTROLS PAGE TEXT =====
if (menu_mode == "controls") {
    draw_set_font(Fontmenue);
    draw_set_halign(fa_center);

    var cx  = grabCamera_Width;
    var cy1 = grabCamera_Height + posy_1 - 40 + y_offset;
    var cy2 = grabCamera_Height + posy_2 - 40 + y_offset;
    var cy3 = grabCamera_Height + posy_3 - 40 + y_offset;
    var cy4 = grabCamera_Height + posy_4 - 40 + y_offset;

    var l1 = "MOVE:    WASD";
    var l2 = "SHOOT:   LEFT MOUSE BUTTON";
    var l3 = "PICK UP: RIGHT MOUSE BUTTON";
    var l4 = "SPRINT: SHIFT  |  MENU: ESC";

    var s = textSize * 0.6;

    draw_text_transformed_color(cx, cy1+2, l1, s, s, wiggle,
        colorShadow,colorShadow,colorShadow,colorShadow,1);
    draw_text_transformed_color(cx, cy1,   l1, s, s, wiggle,
        colorNorm1,colorNorm1,colorNorm1,colorNorm1,1);
    draw_text_transformed_color(cx-2, cy1-2, l1, s, s, wiggle,
        colorAnimate,colorAnimate,colorAnimate,colorAnimate,blink);

    draw_text_transformed_color(cx, cy2+2, l2, s, s, wiggle,
        colorShadow,colorShadow,colorShadow,colorShadow,1);
    draw_text_transformed_color(cx, cy2,   l2, s, s, wiggle,
        colorNorm1,colorNorm1,colorNorm1,colorNorm1,1);
    draw_text_transformed_color(cx-2, cy2-2, l2, s, s, wiggle,
        colorAnimate,colorAnimate,colorAnimate,colorAnimate,blink);

    draw_text_transformed_color(cx, cy3+2, l3, s, s, wiggle,
        colorShadow,colorShadow,colorShadow,colorShadow,1);
    draw_text_transformed_color(cx, cy3,   l3, s, s, wiggle,
        colorNorm1,colorNorm1,colorNorm1,colorNorm1,1);
    draw_text_transformed_color(cx-2, cy3-2, l3, s, s, wiggle,
        colorAnimate,colorAnimate,colorAnimate,colorAnimate,blink);

    draw_text_transformed_color(cx, cy4+2, l4, s, s, wiggle,
        colorShadow,colorShadow,colorShadow,colorShadow,1);
    draw_text_transformed_color(cx, cy4,   l4, s, s, wiggle,
        colorNorm1,colorNorm1,colorNorm1,colorNorm1,1);
    draw_text_transformed_color(cx-2, cy4-2, l4, s, s, wiggle,
        colorAnimate,colorAnimate,colorAnimate,colorAnimate,blink);
}
