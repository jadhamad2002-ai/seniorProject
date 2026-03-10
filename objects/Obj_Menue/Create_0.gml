/// obj_Menue Create

if (!variable_global_exists("highscore")) {
    global.highscore = 0;
}

// === MUSIC ===
global.menu_music_id = audio_play_sound(snd_menu_music, 1, true);

// === CAMERA / TEXT SETUP ===
grabCamera_Width  = camera_get_view_width(view_camera[0]) / 2;
grabCamera_Height = camera_get_view_height(view_camera[0]) / 2;

draw_set_font(Fontmenue);
draw_set_halign(fa_center);

// === MENU MODES ===
menu_mode = "main";

// MAIN PAGE TEXTS
main_text_1 = "Start Game";
main_text_2 = "Account";
main_text_3 = "Leaderboards";
main_text_4 = "Options";
main_text_5 = "Quit";

// ACCOUNT PAGE TEXTS
acc_text_1 = "Register";
acc_text_2 = "Login";
acc_text_3 = "Leaderboards";
acc_text_4 = "Back";
acc_text_5 = "";

// OPTIONS PAGE TEXTS
opt_text_1 = "Master Volume";
opt_text_2 = "Music Volume";
opt_text_3 = "SFX Volume";
opt_text_4 = "Controls";
opt_text_5 = "Back";

// CONTROLS PAGE TEXTS
ctrl_text_1 = "";
ctrl_text_2 = "";
ctrl_text_3 = "";
ctrl_text_4 = "";
ctrl_text_5 = "Back";

// currently displayed texts
text_1 = main_text_1;
text_2 = main_text_2;
text_3 = main_text_3;
text_4 = main_text_4;
text_5 = main_text_5;

// === VOLUME SETTINGS (0..1) ===
if (!variable_global_exists("master_volume")) global.master_volume = 1;
if (!variable_global_exists("music_volume"))  global.music_volume  = 1;
if (!variable_global_exists("sfx_volume"))    global.sfx_volume    = 1;

// === VISUALS ===
textSize = 3;
wiggle   = 0;


colorAnimate = c_white;
colorNorm1   = c_aqua;
colorShadow  = c_black;
colorActive  = c_fuchsia;



// wiggle
start    = -3;
dest     = 3;
duration = 80;
time     = 0;

// blink
start2    = 0;
dest2     = 1;
duration2 = 60;
time2     = 0;
blink     = 0;

// menu positions
posy_1 = 0;
posy_2 = 50;
posy_3 = 100;
posy_4 = 150;
posy_5 = 200;

// highlight trail
draw_Extra    = 0;
draw_ExtraMax = 10;
increase      = true;

// how fast you want it to tick:
animateTime   = room_speed/9 ; // 0.5s per step change, for example
alarm[0]      = animateTime;


// selected item
selected = 1;

// === LOGO SETTINGS ===
logo_text        = "By Jad Hamad";
logo_y_offset    = -220;
logo_scale       = 5;
logo_angle       = 0;
logo_radius_x    = 10;
logo_radius_y    = 10;
logo_angle_speed = 1.5;


score_submitted = false; 
