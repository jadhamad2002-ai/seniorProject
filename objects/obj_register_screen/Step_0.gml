/*/// Step

// --- WIGGLE ---
if (time < duration) {
    wiggle = ease_in_and_out(time, start, dest - start, duration);
    time++;
} else {
    var t = start; start = dest; dest = t; time = 0;
}

// --- SELECTION ---
if (keyboard_check_pressed(vk_down)) {
    active_field = (active_field + 1) mod 4;
    draw_Extra = 0;
}
if (keyboard_check_pressed(vk_up)) {
    active_field = (active_field + 3) mod 4;
    draw_Extra = 0;
}

// --- USERNAME / PASSWORD typing ---
var ch = keyboard_lastchar;

// Username
if (active_field == 0) {
    if (keyboard_check_pressed(vk_backspace) && string_length(username_text) > 0) {
        username_text = string_delete(username_text, string_length(username_text), 1);
    } else if (string_length(ch) == 1 && ch != key_last) {
        username_text += ch;
        key_last = ch;
    }
}

// Password
if (active_field == 1) {
    if (keyboard_check_pressed(vk_backspace) && string_length(password_text) > 0) {
        password_text = string_delete(password_text, string_length(password_text), 1);
    } else if (string_length(ch) == 1 && ch != key_last) {
        password_text += ch;
        key_last = ch;
    }
}

// Reset key_last if no key pressed
if (keyboard_lastkey == -1) key_last = -1;

// --- ENTER ACTIONS ---
if (keyboard_check_pressed(vk_enter)) {
    switch (active_field) {
        case 2: // confirm registration
            show_message("Registered: " + username_text);
            break;
        case 3: // back
            room_goto(Room1); // your menu room
            break;
    }
}
