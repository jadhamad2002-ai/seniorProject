/// obj_enemy Step

// ===== PAUSE / PLAYER / DEATH =====
if (Obj_Control.paused) exit;
if (!instance_exists(Obj_Player)) exit;

// enemy death
if (hp <= 0) {
    instance_destroy(); // your Destroy handles loot/points
    exit;
}

// ===== DISTANCE + STATE DECISION =====
var dist_to_player = point_distance(x, y, Obj_Player.x, Obj_Player.y);

// decide state
if (dist_to_player > alert_range) {
    state = "idle";
} else if (dist_to_player > attack_range) {
    state = "chase";
} else {
    state = "attack";
}

// ===== STATE MACHINE =====
switch (state) {

    // -------- IDLE --------
    case "idle":
        image_speed = 0;
    break;

    // -------- CHASE --------
    case "chase":
        image_speed = 1;

        var dir_to_player = point_direction(x, y, Obj_Player.x, Obj_Player.y);

        // body and legs face movement
        image_angle_ = dir_to_player;
        leg_angle    = dir_to_player;

        // base speed
        var spd = walkSpeed_Aggro;

        // melee enemies run faster
        if (!can_shoot) {
            spd = melee_speed;
        }

        x += lengthdir_x(spd, dir_to_player);
        y += lengthdir_y(spd, dir_to_player);
    break;

    // -------- ATTACK --------
    case "attack":
        image_speed = 0;

        var dir_attack = point_direction(x, y, Obj_Player.x, Obj_Player.y);
        image_angle_ = dir_attack; // body faces player
        // legs keep last chase angle

        // MELEE: keep stepping in slightly so they do not stop outside range
        if (!can_shoot) {
            var step_in = melee_speed * 0.3; // tweak factor
            x += lengthdir_x(step_in, dir_attack);
            y += lengthdir_y(step_in, dir_attack);
        }

        attack_timer--;
        if (attack_timer <= 0) {

            // ===== RANGED ENEMIES =====
            if (can_shoot) {

                // maintain preferred distance (back up if too close)
                var ideal_dist = 200; // tweak for how far ranged guys like to be
                var cur_dist   = point_distance(x, y, Obj_Player.x, Obj_Player.y);

                if (cur_dist < ideal_dist - 16) {
                    var dir_away = point_direction(Obj_Player.x, Obj_Player.y, x, y);
                    var back_spd = 2;
                    x += lengthdir_x(back_spd, dir_away);
                    y += lengthdir_y(back_spd, dir_away);
                }

                // ---- rifle ----
                if (weapon == "rifle") {
                    var shot = instance_create_layer(x, y, "Instances", Obj_Shot_Enemy);
                    shot.speed     = 10;
                    shot.direction = dir_attack;
                    shot.damage    = 1; // 3 hits if player hp = 3
                }
                // ---- shotgun ----
                else if (weapon == "shotgun") {
                    var pellets = 5;
                    var spread  = 8;

                    for (var i = 0; i < pellets; i++) {
                        var d  = dir_attack + random_range(-spread, spread);
                        var sh = instance_create_layer(x, y, "Instances", Obj_Shot_Enemy);
                        sh.speed     = 9;
                        sh.direction = d;
                        sh.damage    = 1; // several pellets may hit
                    }
                }

            }
            // ===== MELEE ENEMIES =====
            else {
                if (point_distance(x, y, Obj_Player.x, Obj_Player.y) <= melee_range) {
                    with (Obj_Player) {
                        // choose one:
                        // instant kill if hp = 3
                        hp = 0;

                        // or, for 2-hit kill:
                        // hp -= 2;
                    }
                }
            }

            attack_timer = attack_time;
        }
    break;
}
