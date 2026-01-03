/// Obj_Control Step

// ===== TOGGLE PAUSE WITH ESC =====
if (keyboard_check_pressed(vk_escape)) {
    paused = !paused;
    if (paused) pause_index = 1;
}

// ===== TIMER (only when not paused) =====
if (!paused) {
    global.time_elapsed += delta_time / 1000000;
}

// ===== MUSIC PLAYLIST LOGIC =====
if (!audio_is_playing(music_playing_id)) {

    music_index++;

    if (music_index >= array_length(music_tracks)) {
        music_tracks = shuffle_array(music_tracks);
        music_index  = 0;
    }

    var snd = music_tracks[music_index];
    music_playing_id = audio_play_sound(snd, 5, false);
    audio_master_gain(global.master_volume);
    audio_sound_gain(music_playing_id, global.music_volume, 0);
}

// ===== PAUSE MENU INPUT =====
if (paused) {
    var key_up   = keyboard_check_pressed(vk_up);
    var key_down = keyboard_check_pressed(vk_down);
    var key_ok   = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

    if (key_down) {
        pause_index++;
        if (pause_index > pause_max_items) pause_index = 1;
    }

    if (key_up) {
        pause_index--;
        if (pause_index < 1) pause_index = pause_max_items;
    }

    if (key_ok) {
        switch (pause_index) {
            case 1: // RESUME
                paused = false;
            break;

            case 2: // MAIN MENU
                if (audio_is_playing(music_playing_id)) {
                    audio_stop_sound(music_playing_id);
                }
                paused = false;
                room_goto(Room1);
            break;

            case 3: // QUIT
                game_end();
            break;
        }
    }
}

// ===== DEATH SCREEN INPUT + HIGHSCORE / SUBMIT =====
if (instance_exists(Obj_Player)) {
    if (Obj_Player.is_dead) {
        show_death_screen = true;

        // update local highscore using run score
        if (score > global.highscore) {
            global.highscore = score;
        }

        // submit score ONCE
        if (!score_submitted) {
            var submit_url = "http://localhost/game/submit_score.php?score=" + string(score);
            url_open(submit_url);
            score_submitted = true;
        }

        if (keyboard_check_pressed(ord("R"))) {
            room_restart();
        }

        if (keyboard_check_pressed(vk_escape)) {
            if (audio_is_playing(music_playing_id)) {
                audio_stop_sound(music_playing_id);
            }
            room_goto(Room1);
        }
    }
}
