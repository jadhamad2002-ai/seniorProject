/// Obj_Control Draw GUI

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// ===== TIMER TOP-CENTER =====
var s   = floor(global.time_elapsed);
var m   = s div 60;
var sec = s mod 60;
var time_str = string_format(m, 2, 0) + ":" + string_format(sec, 2, 0);

var x_mid = gui_w * 0.5;
var y_pos = 24;

draw_set_font(Fontmenue);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var col_shadow = c_black;
var col_teal   = make_color_rgb(0, 255, 200);

// shadow
draw_set_color(col_shadow);
draw_text(x_mid + 1, y_pos + 1, time_str);

// main
draw_set_color(col_teal);
draw_text(x_mid, y_pos, time_str);

// ===== SCORE TOP-LEFT =====
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var sx = 24;
var sy = 48;
var score_text = "SCORE: " + string(score);

draw_set_color(col_shadow);
draw_text(sx + 1, sy + 1, score_text);

draw_set_color(col_teal);
draw_text(sx, sy, score_text);

// ===== PAUSED OVERLAY + MENU =====
if (paused) {
    var tx = gui_w * 0.5;
    var ty = gui_h * 0.5;

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(col_shadow);
    draw_text(tx + 2, ty - 40 + 2, "PAUSED");
    draw_set_color(col_teal);
    draw_text(tx,     ty - 40,     "PAUSED");

    var col_norm   = c_aqua;
    var col_active = make_color_rgb(255, 0, 255);
    var line_h     = 32;

    var opt1 = "RESUME";
    var opt2 = "MAIN MENU";
    var opt3 = "QUIT";

    // option 1
    var col = (pause_index == 1) ? col_active : col_norm;
    draw_set_color(col_shadow);
    draw_text(tx + 2, ty + 2, opt1);
    draw_set_color(col);
    draw_text(tx,     ty,     opt1);

    // option 2
    col = (pause_index == 2) ? col_active : col_norm;
    var y2 = ty + line_h;
    draw_set_color(col_shadow);
    draw_text(tx + 2, y2 + 2, opt2);
    draw_set_color(col);
    draw_text(tx,     y2,     opt2);

    // option 3
    col = (pause_index == 3) ? col_active : col_norm;
    var y3 = ty + line_h * 2;
    draw_set_color(col_shadow);
    draw_text(tx + 2, y3 + 2, opt3);
    draw_set_color(col);
    draw_text(tx,     y3,     opt3);
}

// ===== DEATH SCREEN OVERLAY =====
if (show_death_screen) {
    var cx = gui_w * 0.5;

    var col_main    = col_teal;
    var scale_big   = 1.2;
    var scale_small = 0.8;

    draw_set_font(Fontmenue);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1);

    var title = "YOU DIED";
    var ty    = gui_h * 0.4;

    draw_set_color(col_shadow);
    draw_text_transformed(cx + 1, ty + 1, title, scale_big, scale_big, 0);
    draw_set_color(col_main);
    draw_text_transformed(cx,     ty,     title, scale_big, scale_big, 0);

    var line1 = "Press R to restart";
    var ly1   = gui_h * 0.5;

    draw_set_color(col_shadow);
    draw_text_transformed(cx + 1, ly1 + 1, line1, scale_small, scale_small, 0);
    draw_set_color(col_main);
    draw_text_transformed(cx,     ly1,     line1, scale_small, scale_small, 0);

    var line2 = "Press ESC for Main Menu";
    var ly2   = gui_h * 0.5 + 30;

    draw_set_color(col_shadow);
    draw_text_transformed(cx + 1, ly2 + 1, line2, scale_small, scale_small, 0);
    draw_set_color(col_main);
    draw_text_transformed(cx,     ly2,     line2, scale_small, scale_small, 0);
}
