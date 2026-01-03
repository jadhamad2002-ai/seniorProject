/// Obj_Player Step

if (Obj_Control.paused) {
    exit;
}

// death check
if (hp <= 0 && !is_dead) {
    is_dead = true;
    hp = 0;
}

// if dead, stop all logic below (no movement/shooting/etc.)
if (is_dead) {
    exit;
}

// Face mouse
direction    = point_direction(x, y, mouse_x, mouse_y);
image_angle_ = direction;

// Movement input
// Movement input
var left  = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up    = keyboard_check(ord("W"));
var down  = keyboard_check(ord("S"));

var hx = right - left;
var vy = down - up;

// sprint input (hold Shift)
is_sprinting = keyboard_check(vk_shift);

// choose speed
var moveSpeed = is_sprinting ? sprintSpeed : walkSpeed;

// predictive collision uses moveSpeed (so sprint respects walls)
var result_h = hx * (moveSpeed + 1);
var result_v = vy * (moveSpeed + 1);

if (!place_meeting(x + result_h, y, obj_wall)) {
    x += hx * moveSpeed;
}
if (!place_meeting(x, y + result_v, obj_wall)) {
    y += vy * moveSpeed;
}


// Legs anim + move dir
if (hx != 0 || vy != 0) {
    move_dir   = point_direction(0, 0, hx, vy);
    walk_Frame += walk_FrameSpeed;
    if (walk_Frame >= sprite_get_number(spr_P_legs)) walk_Frame = 0;
} else {
    walk_Frame = 0;
}
// CAMERA PAN OFFSET WITH E
if (keyboard_check(ord("E"))) {
    // direction from player to mouse
    var dir_to_mouse = point_direction(x, y, mouse_x, mouse_y);
    var maxOffset    = 120; // how far camera can pan from player

    // desired offset
    camera_offset_x = lengthdir_x(maxOffset, dir_to_mouse);
    camera_offset_y = lengthdir_y(maxOffset, dir_to_mouse);
} else {
    camera_offset_x = 0;
    camera_offset_y = 0;
}



// THROW WEAPON (RMB)
if (mouse_check_button_pressed(mb_right)) {
    if (weapon != "unarmed") {
        var t = instance_create_layer(x, y, "Instances", obj_Weapon_Throw);
        t.direction = image_angle_;
        t.speed     = random_range(7, 10);
        t.ammoThrow = ammoPlayer;

        switch (weapon) {
            case "pipe":    t.sprite_index = spr_pipe;    break;
            case "knife":   t.sprite_index = spr_knife;   break;

            case "pistol":  t.sprite_index = spr_pistol;  break;
            case "rifle":   t.sprite_index = spr_rifle;   break;
            case "shotgun": t.sprite_index = spr_shotgun; break;
            case "mp5":     t.sprite_index = spr_mp5;     break;

            default:
                instance_destroy(t); // safety
                break;
        }

        weapon        = "unarmed";
        weapon_sprite = spr_Pwalk_Unarmed;
        ammoPlayer    = 0;
    }
}

// timers
if (shoot_timer  > 0) shoot_timer--;
if (attack_timer > 0) attack_timer--;

// SHOOTING / MELEE
var base_dir = point_direction(x, y, mouse_x, mouse_y);
var dir, mx, my;

// guns require ammo + not attacking
var ready_to_fire = (shoot_timer == 0) && (attack_timer == 0) && (ammoPlayer > 0);

if (mouse_check_button(mb_left)) {

    switch (weapon) {

        // ---------------- GUNS ----------------
        case "pistol": {
            if (!ready_to_fire) break;

            // SFX
            var snd = audio_play_sound(sfx_rifle, 1, false); // or sfx_pistol if you make one
            audio_sound_gain(snd, global.sfx_volume, 0);

            dir = base_dir + random_range(-Obj_Control.spread_pistol, Obj_Control.spread_pistol);

            var forward = 27, side = -1;
            mx  = x + lengthdir_x(forward, dir) + lengthdir_x(side, dir + 90);
            my  = y + lengthdir_y(forward, dir) + lengthdir_y(side, dir + 90);

            var shot = instance_create_layer(mx, my, "Instances", Obj_Shot);
            shot.direction    = dir;
            shot.speed        = Obj_Control.ShotSpeed_pistol;
            shot.friction     = Obj_Control.friction_pistol;
            shot.damage       = Obj_Control.damage_pistol;
            shot.angle_offset = 0;
            shot.image_angle_ = dir + shot.angle_offset;

            sprite_index = spr_PAttackpistol;
            image_index  = 0;
            image_speed  = 1;
            attack_timer = 10;
            shoot_timer  = Obj_Control.shoot_timer_pistol;
            ammoPlayer--;
        } break;

        case "rifle": {
            if (!ready_to_fire) break;

            // SFX
            var snd = audio_play_sound(sfx_rifle, 1, false);
            audio_sound_gain(snd, global.sfx_volume, 0);

            dir = base_dir + random_range(-Obj_Control.spread_rifle, Obj_Control.spread_rifle);

            var forward = 18, side = -1;
            mx  = x + lengthdir_x(forward, dir) + lengthdir_x(side, dir + 90);
            my  = y + lengthdir_y(forward, dir) + lengthdir_y(side, dir + 90);

            var shot = instance_create_layer(mx, my, "Instances", Obj_Shot);
            shot.direction    = dir;
            shot.speed        = Obj_Control.ShotSpeed_rifle;
            shot.friction     = Obj_Control.friction_rifle;
            shot.damage       = Obj_Control.damage_rifle;
            shot.angle_offset = 0;
            shot.image_angle_ = dir + shot.angle_offset;

            sprite_index = spr_PAttackrifle;
            image_index  = 0;
            image_speed  = 1;
            attack_timer = 10;
            shoot_timer  = Obj_Control.shoot_timer_rifle;
            ammoPlayer--;
        } break;

        case "mp5": {
            if (!ready_to_fire) break;

            // SFX
            var snd = audio_play_sound(sfx_rifle, 1, false); // or sfx_mp5
            audio_sound_gain(snd, global.sfx_volume, 0);

            dir = base_dir + random_range(-Obj_Control.spread_mp5, Obj_Control.spread_mp5);

            var forward = 27, side = -1;
            mx  = x + lengthdir_x(forward, dir) + lengthdir_x(side, dir + 90);
            my  = y + lengthdir_y(forward, dir) + lengthdir_y(side, dir + 90);

            var shot = instance_create_layer(mx, my, "Instances", Obj_Shot);
            shot.direction    = dir;
            shot.speed        = Obj_Control.ShotSpeed_mp5;
            shot.friction     = Obj_Control.friction_mp5;
            shot.damage       = Obj_Control.damage_mp5;
            shot.angle_offset = 0;
            shot.image_angle_ = dir + shot.angle_offset;

            sprite_index = spr_PAttackmp5;
            image_index  = 0;
            image_speed  = 1;
            attack_timer = 10;
            shoot_timer  = Obj_Control.shoot_timer_mp5;
            ammoPlayer--;
        } break;

        case "shotgun": {
            if (!ready_to_fire) break;

            // SFX
            var snd = audio_play_sound(sfx_shotgun, 1, false);
            audio_sound_gain(snd, global.sfx_volume, 0);

            var forward = 18, side = -1;
            var pellets = 5;

            for (var i = 0; i < pellets; i++) {
                dir = base_dir + random_range(-Obj_Control.spread_shotgun, Obj_Control.spread_shotgun);

                mx  = x + lengthdir_x(forward, dir) + lengthdir_x(side, dir + 90);
                my  = y + lengthdir_y(forward, dir) + lengthdir_y(side, dir + 90);

                var shot = instance_create_layer(mx, my, "Instances", Obj_Shot);
                shot.direction    = dir;
                shot.speed        = Obj_Control.ShotSpeed_shotgun;
                shot.friction     = Obj_Control.friction_shotgun;
                shot.damage       = Obj_Control.damage_shotgun;
                shot.angle_offset = 0;
                shot.image_angle_ = dir + shot.angle_offset;
            }

            sprite_index = spr_PAttackshotgun;
            image_index  = 0;
            image_speed  = 0.8;
            attack_timer = 40;
            shoot_timer  = Obj_Control.shoot_timer_shotgun;
            ammoPlayer--;
        } break;


        // ---------------- MELEE ----------------
        case "pipe": {
            if (attack_timer > 0) break;

            sprite_index = spr_PAttackpipe;
            image_index  = 0;
            image_speed  = 0.2;
            attack_timer = 20;
            shoot_timer  = 60;

            var dist = 24;
            var hx = x + lengthdir_x(dist, base_dir);
            var hy = y + lengthdir_y(dist, base_dir);

            var hb = instance_create_layer(hx, hy, "Instances", obj_MeleeHitbox);
            hb.owner       = id;
            hb.weapon_type = "pipe";
        } break;

        case "knife": {
            if (attack_timer > 0) break;

            sprite_index = spr_PAttackknife;
            image_index  = 0;
            image_speed  = 0.2;
            attack_timer = 60;
            shoot_timer  = 30;

            var dist = 24;
            var hx = x + lengthdir_x(dist, base_dir);
            var hy = y + lengthdir_y(dist, base_dir);

            var hb = instance_create_layer(hx, hy, "Instances", obj_MeleeHitbox);
            hb.owner       = id;
            hb.weapon_type = "knife";
        } break;
    }
}

// Reset to idle/walk only when not attacking
if (attack_timer == 0) {
    if (weapon == "unarmed") {
        sprite_index = spr_Pwalk_Unarmed;
    }
}

// SAFETY: visible sprite
if (sprite_index == -1) {
    if (weapon == "unarmed") {
        sprite_index = spr_Pwalk_Unarmed;
    } else {
        switch (weapon) {
            case "pistol":  sprite_index = spr_walk_pistol;  break;
            case "rifle":   sprite_index = spr_walk_rifle;   break;
            case "shotgun": sprite_index = spr_walk_shotgun; break;
            case "mp5":     sprite_index = spr_walk_mp5;     break;
            case "pipe":    sprite_index = spr_walk_pipe;    break;
            case "knife":   sprite_index = spr_walk_knife;   break;
        }
    }
}
