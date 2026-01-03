/// obj_Weapon_Pickup Collision with obj_Player

if (mouse_check_button_pressed(mb_right)) {
    // If player already holding another weapon, drop it first
    if (other.weapon != "unarmed") {
        var dropped = instance_create_layer(other.x, other.y, "Instances", obj_Weapon_Pickup);
        
        switch (other.weapon) {
            case "pistol":  dropped.sprite_index = spr_pistol;  break;
            case "rifle":   dropped.sprite_index = spr_rifle;   break;
            case "shotgun": dropped.sprite_index = spr_shotgun; break;
            case "mp5":     dropped.sprite_index = spr_mp5;     break;
            case "pipe":    dropped.sprite_index = spr_pipe;    break;
            case "knife":   dropped.sprite_index = spr_knife;   break;
        }
    }

    // Equip new weapon
    var s = sprite_index;
    with (other) {
        switch (s) {
            case spr_pistol:  weapon_sprite = spr_walk_pistol;  weapon = "pistol";  break;
            case spr_shotgun: weapon_sprite = spr_walk_shotgun; weapon = "shotgun"; break;
            case spr_rifle:   weapon_sprite = spr_walk_rifle;   weapon = "rifle";   break;
            case spr_mp5:     weapon_sprite = spr_walk_mp5;     weapon = "mp5";     break;
            case spr_pipe:    weapon_sprite = spr_walk_pipe;    weapon = "pipe";    break;
            case spr_knife:   weapon_sprite = spr_walk_knife;   weapon = "knife";   break;
            default:          weapon_sprite = spr_Pwalk_Unarmed;weapon = "unarmed"; break;
        }
    }
    
    other.ammoPlayer = ammoPickup;

    // PLAY PICKUP SFX WITH SFX VOLUME
    var snd = audio_play_sound(sfx_pickup, 1, false);
    audio_sound_gain(snd, global.sfx_volume, 0);

    instance_destroy();
}
