/// melee child Step
event_inherited(); // OPTIONAL – only if you still want some parent logic [web:390][web:397]

// After this line we FORCE melee behaviour we want.
// Easiest: completely replace state logic for melee:

var dist_to_player = point_distance(x, y, Obj_Player.x, Obj_Player.y);

if (dist_to_player > alert_range) {
    state = "idle";
} else if (dist_to_player > attack_range) {
    state = "chase";
} else {
    state = "attack";
}

switch (state) {

    case "idle":
        image_speed = 0;
    break;

    case "chase":
        image_speed = 1;

        var dir = point_direction(x, y, Obj_Player.x, Obj_Player.y);
        image_angle_ = dir;
        leg_angle    = dir;

        var spd = melee_speed;
        x += lengthdir_x(spd, dir);
        y += lengthdir_y(spd, dir);
    break;

    case "attack":
        image_speed = 0;

        var dir_a = point_direction(x, y, Obj_Player.x, Obj_Player.y);
        image_angle_ = dir_a;

        // keep moving in while attacking
        var step_in = melee_speed * 0.6;
        x += lengthdir_x(step_in, dir_a);
        y += lengthdir_y(step_in, dir_a);

        attack_timer--;
        if (attack_timer <= 0) {

            if (point_distance(x, y, Obj_Player.x, Obj_Player.y) <= melee_range) {
                with (Obj_Player) {
                    hp = 0; // instant kill
                }
            }

            attack_timer = attack_time;
        }
    break;
}
