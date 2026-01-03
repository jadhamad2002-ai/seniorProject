/// Obj_Control Create

audio_stop_all();
global.time_elapsed = 0;

score_submitted = false;

show_death_screen = false;

debug = true;

score = 0; // run score for THIS game
if (!variable_global_exists("highscore")) {
    global.highscore = 0; // best score across runs (session/local)
}

// ===== WEAPON VALUES =====
damage_pipe   = 1;
damage_knife  = 1;

damage_pistol  = 1;
damage_rifle   = 1;
damage_shotgun = 1;
damage_mp5     = 1;

ShotSpeed_pistol  = 10;
ShotSpeed_rifle   = 16;
ShotSpeed_mp5     = 13;
ShotSpeed_shotgun = 20;

friction_pistol  = 0.04;
friction_rifle   = 0.04;
friction_mp5     = 0.04;
friction_shotgun = 0.02;

shoot_timer_pistol  = 15;
shoot_timer_rifle   = 7;
shoot_timer_mp5     = 7;
shoot_timer_shotgun = 25;

ammo_pistol  = 12;
ammo_rifle   = 40;
ammo_mp5     = 40;
ammo_shotgun = 8;

spread_pistol  = 1;
spread_rifle   = 2;
spread_mp5     = 2;
spread_shotgun = 3;

// ===== PAUSE MENU =====
paused          = false;
pause_index     = 1;
pause_max_items = 3;

// ===== MUSIC PLAYLIST SETUP =====
audio_stop_all();

music_tracks     = [ snd_gameplay_music1, snd_gameplay_music2, snd_gameplay_music3 ];
music_index      = 0;
music_playing_id = noone;

// shuffle helper
function shuffle_array(_a) {
    var n = array_length(_a);
    for (var i = n - 1; i > 0; i--) {
        var j = irandom(i);
        var tmp = _a[i];
        _a[i] = _a[j];
        _a[j] = tmp;
    }
    return _a;
}

randomize();
music_tracks = shuffle_array(music_tracks);

// start first track
var snd = music_tracks[music_index];
music_playing_id = audio_play_sound(snd, 5, false);
audio_master_gain(global.master_volume);
audio_sound_gain(music_playing_id, global.music_volume, 0);
