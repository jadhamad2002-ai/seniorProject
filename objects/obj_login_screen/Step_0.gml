/// obj_login_screen Step

// ===== FIRST FRAME AFTER OPENING =====
// Avoid consuming the same Enter that opened this screen
if (just_opened) {

    // allow instant cancel with ESC
    if (keyboard_check_pressed(vk_escape)) {
        keyboard_string        = "";
        global.show_login_page = false;
        instance_destroy();
        exit;
    }

    // wait until Enter/Space are released once
    if (!keyboard_check(vk_enter) && !keyboard_check(vk_space)) {
        just_opened = false;
    }

    exit; // skip rest of Step while just_opened is true
}

// ===== EXIT WITH ESC =====
if (keyboard_check_pressed(vk_escape)) {
    keyboard_string        = "";
    global.show_login_page = false;
    instance_destroy();
    exit;
}

// ===== WIGGLE / BLINK ANIMATION =====
if (time < duration) {
    wiggle = ease_in_and_out(time, start, dest - start, duration);
    time++;
} else {
    var t = start; start = dest; dest = t; time = 0;
}

if (time2 < duration2) {
    blink = ease_in_and_out(time2, start2, dest2 - start2, duration2);
    time2++;
} else {
    var t2 = start2; start2 = dest2; dest2 = t2; time2 = 0;
}

// ===== NAVIGATION (UP / DOWN) =====
if (keyboard_check_pressed(vk_down)) {
    selected++;
    if (selected > 3) selected = 0;
}

if (keyboard_check_pressed(vk_up)) {
    selected--;
    if (selected < 0) selected = 3;
}

// field 0=user, 1=pass
if (selected <= 1) field_index = selected;

// ===== TEXT INPUT =====
if (field_index == 0) {
    username_text = keyboard_string;
} else {
    password_text = keyboard_string;
}

if (string_length(keyboard_string) > 20) {
    keyboard_string = string_copy(keyboard_string, 1, 20);
}

// ===== ENTER (CONFIRM / BACK) =====
if (keyboard_check_pressed(vk_enter)) {

    // CONFIRM LOGIN
    if (selected == 2) {
        var u = string_trim(username_text);
        var p = string_trim(password_text);

        if (u != "" && p != "") {
            with (obj_login_controller) {
                login_username = u;
                login_password = p;
                start_login(); // or start_register() if you prefer
            }
        }

        keyboard_string        = "";
        global.show_login_page = false;
        instance_destroy();
    }

    // BACK
    else if (selected == 3) {
        keyboard_string        = "";
        global.show_login_page = false;
        instance_destroy();
    }
}
