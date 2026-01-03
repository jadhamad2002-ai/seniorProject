/// obj_enemy_knife Step

if (Obj_Control.paused) exit;
if (!instance_exists(Obj_Player)) exit;

if (hp <= 0) {
    instance_destroy();
    exit;
}

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
        x += lengthdir_x(melee_speed, dir);
        y += lengthdir_y(melee_speed, dir);
    break;

    case "attack":
        image_speed = 0;
        var dir_a = point_direction(x, y, Obj_Player.x, Obj_Player.y);
        image_angle_ = dir_a;
        var step_in = melee_speed * 0.6;
        x += lengthdir_x(step_in, dir_a);
        y += lengthdir_y(step_in, dir_a);

        attack_timer--;
        if (attack_timer <= 0) {
            if (point_distance(x, y, Obj_Player.x, Obj_Player.y) <= melee_range) {
                with (Obj_Player) hp = 0;
            }
            attack_timer = attack_time;
        }
    break;
}
