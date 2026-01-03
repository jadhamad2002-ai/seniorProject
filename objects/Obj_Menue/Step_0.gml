/// obj_Menue Step

// === UPDATE CURRENT PAGE TEXTS ===
switch (menu_mode) {
    case "main":
        text_1 = main_text_1;
        text_2 = main_text_2;
        text_3 = main_text_3;
        text_4 = main_text_4;
        text_5 = main_text_5;
    break;

    case "account":
        text_1 = acc_text_1;
        text_2 = acc_text_2;
        text_3 = acc_text_3;
        text_4 = acc_text_4;
        text_5 = acc_text_5;
    break;

    case "options":
        text_1 = opt_text_1;
        text_2 = opt_text_2;
        text_3 = opt_text_3;
        text_4 = opt_text_4;
        text_5 = opt_text_5;
    break;

    case "controls":
        text_1 = ctrl_text_1;
        text_2 = ctrl_text_2;
        text_3 = ctrl_text_3;
        text_4 = ctrl_text_4;
        text_5 = ctrl_text_5;
    break;
}

// === APPLY VOLUME ===
audio_master_gain(global.master_volume);
if (audio_is_playing(global.menu_music_id)) {
    audio_sound_gain(global.menu_music_id, global.music_volume, 0);
}

// === WIGGLE ===
if (time < duration) {
    wiggle = ease_in_and_out(time, start, dest - start, duration);
    time++;
} else {
    var t = start; start = dest; dest = t; time = 0;
}

// === BLINK ===
if (time2 < duration2) {
    blink = ease_in_and_out(time2, start2, dest2 - start2, duration2);
    time2++;
} else {
    var t2 = start2; start2 = dest2; dest2 = t2; time2 = 0;
}

// === UP / DOWN ===
var keyDown = keyboard_check_released(vk_down);
var keyUp   = keyboard_check_released(vk_up);

var max_items;
switch (menu_mode) {
    case "main":     max_items = 5; break;
    case "account":  max_items = 4; break;
    case "options":  max_items = 5; break;
    case "controls": max_items = 1; break;
}

if (keyDown) {
    draw_Extra = 0;
    selected++;
    if (selected > max_items) selected = 1;
}
if (keyUp) {
    draw_Extra = 0;
    selected--;
    if (selected < 1) selected = max_items;
}

if (menu_mode == "controls") selected = 1;

// === VOLUME CHANGE (OPTIONS) ===
if (menu_mode == "options") {
    var stepVol = 0.1;

    if (keyboard_check_pressed(vk_left)) {
        switch (selected) {
            case 1: global.master_volume = max(0, global.master_volume - stepVol); break;
            case 2: global.music_volume  = max(0, global.music_volume  - stepVol); break;
            case 3: global.sfx_volume    = max(0, global.sfx_volume    - stepVol); break;
        }
    }

    if (keyboard_check_pressed(vk_right)) {
        switch (selected) {
            case 1: global.master_volume = min(1, global.master_volume + stepVol); break;
            case 2: global.music_volume  = min(1, global.music_volume  + stepVol); break;
            case 3: global.sfx_volume    = min(1, global.sfx_volume    + stepVol); break;
        }
    }
}

// === CONFIRM (ENTER / SPACE) ===
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {

    // MAIN PAGE
    if (menu_mode == "main") {
        switch (selected) {
            case 1: // Start Game
                if (audio_is_playing(global.menu_music_id)) {
                    audio_sound_gain(global.menu_music_id, 0, room_speed);
                }
                alarm[1] = room_speed;
            break;

            case 2: // Account
                menu_mode = "account";
                selected  = 1;
            break;

            case 3: // Leaderboards (local stub)
                url_open("http://localhost/game/highscores.php");
            break;

            case 4: // Options
                menu_mode = "options";
                selected  = 1;
            break;

            case 5: // Quit
                game_end();
            break;
        }
    }

    // ACCOUNT PAGE
    else if (menu_mode == "account") {
        switch (selected) {
            case 1: // Register → open local XAMPP page
		         url_open("http://localhost/game/register.php");
            break;

            case 2: // Login
                url_open("http://localhost/game/login.php");
            break;

            case 3: // Leaderboards
                url_open("http://localhost/game/highscores.php");
            break;

            case 4: // Back
                menu_mode = "main";
                selected  = 1;
            break;
        }
    }

    // OPTIONS PAGE
    else if (menu_mode == "options") {
        switch (selected) {
            case 4:
                menu_mode = "controls";
                selected  = 1;
            break;

            case 5:
                menu_mode = "main";
                selected  = 1;
            break;
        }
    }

    // CONTROLS PAGE
    else if (menu_mode == "controls") {
        menu_mode = "options";
        selected  = 4;
    }
}

// === LOGO ANGLE UPDATE ===
logo_angle += logo_angle_speed;
if (logo_angle >= 360) logo_angle -= 360;

/*

// use background hue, but darker
var h  = global.background_hue;      // same hue as bg
var h2 = h + 32; if (h2 >= 256) h2 -= 256; // second hue if you want

colorShadow  = make_color_hsv(h,  menu_sat,       60);       // very dark
colorNorm1   = make_color_hsv(h,  menu_sat,       menu_val); // main text
colorActive  = make_color_hsv(h2, menu_sat + 40,  menu_val_hi); // highlight
colorAnimate = make_color_hsv(h2, menu_sat,       menu_val); // accent
