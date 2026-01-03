/// obj_login_screen Create

selected = 0; // 0=user,1=pass,2=confirm,3=back

username_text = "";
password_text = "";

just_opened = true;

keyboard_string = "";
field_index     = 0;

textSize = 3;
wiggle   = 0;

start    = -3;
dest     = 3;
duration = 80;
time     = 0;

start2    = 0;
dest2     = 1;
duration2 = 60;
time2     = 0;
blink     = 0;

colorAnimate = c_white;
colorNorm1   = c_aqua;
colorShadow  = c_black;
colorActive  = c_fuchsia;
