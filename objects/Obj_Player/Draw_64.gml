/// Obj_Player Draw GUI

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var margin = 18;
var x_left = margin;
var y_bottom = gui_h - margin;

// basic style
draw_set_font(Fontmenue);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

// colors matching menu
var col_shadow = c_black;
var col_main   = make_color_rgb(0, 255, 200);  // teal like logo/menu
var col_label  = c_white;

// text strings
var txt_weapon = "WEAPON " + string(weapon);
var txt_ammo   = "AMMO   " + string(ammoPlayer);

// small scale factor
var scale = 0.7;

// draw WEAPON line (shadow + text)
var y1 = y_bottom - 18;
draw_set_color(col_shadow);
draw_text_transformed(x_left + 1, y1 + 1, txt_weapon, scale, scale, 0); // shadow [web:46][web:120]
draw_set_color(col_main);
draw_text_transformed(x_left,     y1,     txt_weapon, scale, scale, 0);

// draw AMMO line
var y2 = y_bottom;
draw_set_color(col_shadow);
draw_text_transformed(x_left + 1, y2 + 1, txt_ammo, scale, scale, 0);
draw_set_color(col_main);
draw_text_transformed(x_left,     y2,     txt_ammo, scale, scale, 0);
