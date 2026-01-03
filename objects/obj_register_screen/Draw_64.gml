/*/// Draw GUI

var gw = display_get_gui_width();
var gh = display_get_gui_height();
var cx = gw * 0.5;
var cy = gh * 0.6;

var line_h = 50;
var y_title = cy - line_h * 2 - 60;
var ys = [cy - line_h * 2, cy - line_h, cy, cy + line_h];

draw_set_font(Fontmenue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// --- TITLE ---
var title = "REGISTER NEW ACCOUNT";
draw_text_transformed_color(cx, y_title + 2, title, textSize, textSize, wiggle, colorShadow,colorShadow,colorShadow,colorShadow,1);
draw_text_transformed_color(cx, y_title, title, textSize, textSize, wiggle, colorNorm1,colorNorm1,colorNorm1,colorNorm1,1);
draw_text_transformed_color(cx - 2, y_title - 2, title, textSize, textSize, wiggle, colorAnimate,colorAnimate,colorAnimate,colorAnimate,blink);

// --- ROW STRINGS ---
var rows = [
    "USERNAME: " + username_text,
    "PASSWORD: " + string_repeat("*", string_length(password_text)),
    "CONFIRM REGISTRATION",
    "BACK"
];

// --- DRAW ALL ROWS (base shadow + normal + animate) ---
for (var i = 0; i < 4; i++) {
    draw_text_transformed_color(cx, ys[i] + 2, rows[i], textSize, textSize, wiggle, colorShadow,colorShadow,colorShadow,colorShadow,1);
    draw_text_transformed_color(cx, ys[i], rows[i], textSize, textSize, wiggle, colorNorm1,colorNorm1,colorNorm1,colorNorm1,1);
    draw_text_transformed_color(cx - 2, ys[i] - 2, rows[i], textSize, textSize, wiggle, colorAnimate,colorAnimate,colorAnimate,colorAnimate,blink);
}
 
// --- SELECTED ROW EXTRA Z-AXIS TRAIL ---
var sel_y    = ys[active_field];
var sel_text = rows[active_field];

for (var j = 0; j < draw_Extra; j++) {
    draw_text_transformed_color(cx + j, sel_y, sel_text, textSize, textSize, wiggle, colorActive,colorActive,colorActive,colorActive,1);
    draw_text_transformed_color(cx + j, sel_y + 2, sel_text, textSize, textSize, wiggle, colorShadow,colorShadow,colorShadow,colorShadow,1);
}
