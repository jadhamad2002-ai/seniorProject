/// obj_login_screen Draw

var gw = display_get_gui_width();
var gh = display_get_gui_height();
var cx = gw * 0.5;
var cy = gh * 0.7;

var line_h = 50;
var y1 = cy - line_h * 2; // USERNAME
var y2 = cy - line_h;     // PASSWORD
var y3 = cy;              // CONFIRM
var y4 = cy + line_h;     // BACK

draw_set_font(Fontmenue);
draw_set_halign(fa_center);

var s = textSize;

// ==== TITLE ====
var txt = "ACCOUNT";

// shadow
draw_text_transformed_color(
    cx, y1 - 60 + 2, txt,
    s, s, wiggle,
    colorShadow, colorShadow, colorShadow, colorShadow, 1
);
// main
draw_text_transformed_color(
    cx, y1 - 60, txt,
    s, s, wiggle,
    colorNorm1, colorNorm1, colorNorm1, colorNorm1, 1
);
// highlight
draw_text_transformed_color(
    cx - 2, y1 - 60 - 2, txt,
    s, s, wiggle,
    colorAnimate, colorAnimate, colorAnimate, colorAnimate,
    blink
);

// helper macro-like block to draw one row
var row_y;
var row_text;
var is_sel;

// ==== USERNAME ROW ====
row_y    = y1;
row_text = "USERNAME: " + username_text;
is_sel   = (selected == 0);

// shadow
draw_text_transformed_color(
    cx, row_y + 2, row_text,
    s, s, wiggle,
    colorShadow, colorShadow, colorShadow, colorShadow, 1
);
// main
draw_text_transformed_color(
    cx, row_y, row_text,
    s, s, wiggle,
    colorNorm1, colorNorm1, colorNorm1, colorNorm1, 1
);
// highlight if selected
draw_text_transformed_color(
    cx - 2, row_y - 2, row_text,
    s, s, wiggle,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    blink
);

// ==== PASSWORD ROW ====
var mask = "";
for (var i = 0; i < string_length(password_text); i++) mask += "*";

row_y    = y2;
row_text = "PASSWORD: " + mask;
is_sel   = (selected == 1);

// shadow
draw_text_transformed_color(
    cx, row_y + 2, row_text,
    s, s, wiggle,
    colorShadow, colorShadow, colorShadow, colorShadow, 1
);
// main
draw_text_transformed_color(
    cx, row_y, row_text,
    s, s, wiggle,
    colorNorm1, colorNorm1, colorNorm1, colorNorm1, 1
);
// highlight
draw_text_transformed_color(
    cx - 2, row_y - 2, row_text,
    s, s, wiggle,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    blink
);

// ==== CONFIRM ROW ====
row_y    = y3;
row_text = "CONFIRM LOGIN";

is_sel   = (selected == 2);

// shadow
draw_text_transformed_color(
    cx, row_y + 2, row_text,
    s, s, wiggle,
    colorShadow, colorShadow, colorShadow, colorShadow, 1
);
// main
draw_text_transformed_color(
    cx, row_y, row_text,
    s, s, wiggle,
    colorNorm1, colorNorm1, colorNorm1, colorNorm1, 1
);
// highlight
draw_text_transformed_color(
    cx - 2, row_y - 2, row_text,
    s, s, wiggle,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    blink
);

// ==== BACK ROW ====
row_y    = y4;
row_text = "BACK";
is_sel   = (selected == 3);

// shadow
draw_text_transformed_color(
    cx, row_y + 2, row_text,
    s, s, wiggle,
    colorShadow, colorShadow, colorShadow, colorShadow, 1
);
// main
draw_text_transformed_color(
    cx, row_y, row_text,
    s, s, wiggle,
    colorNorm1, colorNorm1, colorNorm1, colorNorm1, 1
);
// highlight
draw_text_transformed_color(
    cx - 2, row_y - 2, row_text,
    s, s, wiggle,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    is_sel ? colorActive : colorAnimate,
    blink
);
