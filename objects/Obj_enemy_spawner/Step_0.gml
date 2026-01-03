/// obj_EnemySpawner Step

if (Obj_Control.paused) {
    exit;
}

// Count down
spawn_timer--;

// When it hits zero, spawn and speed up
if (spawn_timer <= 0) {
    // Make next spawn a bit sooner (harder over time)
    spawn_time  = max(spawn_time_min, spawn_time - spawn_time_step);
    spawn_timer = spawn_time;

    // minimum distance from player to spawn
    var min_dist = 128; // tweak to taste

    var sx, sy, ok;
    repeat (50) { // safety loop so it doesn't get stuck forever
        // random X/Y inside room, with a margin of 32 pixels from the edges
        sx = irandom_range(32, room_width  - 32);
        sy = irandom_range(32, room_height - 32);

        // check distance to player
        ok = true;
        if (instance_exists(Obj_Player)) {
            if (point_distance(sx, sy, Obj_Player.x, Obj_Player.y) < min_dist) {
                ok = false;
            }
        }

        // optional: avoid walls too
        if (ok && position_meeting(sx, sy, obj_wall)) {
            ok = false;
        }

        if (ok) break;
    }

    if (ok) {
        var enemy_type = choose(
            obj_enemy_rifle,
            obj_enemy_shotgun,
            obj_enemy_knife,
            obj_enemy_pipe
        );

        instance_create_layer(sx, sy, "Instances", enemy_type);
    }
}
