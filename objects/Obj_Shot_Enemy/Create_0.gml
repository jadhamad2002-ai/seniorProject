/// Obj_Shot_Enemy Create

damage = 1;      // 3 hits to kill the 3‑HP player
image_speed = 0;

if (!variable_instance_exists(id, "angle_offset")) {
    angle_offset = 0;
}

image_angle_ = direction + angle_offset;
