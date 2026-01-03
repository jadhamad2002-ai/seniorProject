// DESTROY EVENT

//instance_destroy(emote);

if (weapon != "") {

    var spriteToPassIn = spr_knife; // default
    var ammToPassIn    = 0;

    switch (weapon) {
        case "knife":
            spriteToPassIn = spr_knife;
            break;

        case "pipe":
            spriteToPassIn = spr_pipe;
            break;

        case "rifle":
            spriteToPassIn = spr_rifle;
            ammToPassIn    = Obj_Control.ammo_rifle;
            break;

        case "shotgun":
            spriteToPassIn = spr_shotgun;
            ammToPassIn    = Obj_Control.ammo_shotgun;
            break;
    }

    var pickUp = instance_create_layer(x, y, "Instances", obj_Weapon_Pickup);
    pickUp.ammoPickup   = ammToPassIn;
    pickUp.sprite_index = spriteToPassIn;
}

/// obj_enemy Destroy

var pts = 400; // points for this enemy

// 1) ADD TO GLOBAL SCORE
score += pts;


// 2) CREATE DAMAGE NUMBER POPUP
var dn = instance_create_layer(x, y, "Instances", obj_DmgNumber);
dn.value = pts;

// Enemy death / Destroy event
// 10% chance to play scream
if (random(100) < 10) {   // 0–99, ~10 values under 10 → 10%
    audio_play_sound(sfx_scream, 10, false);
}



 