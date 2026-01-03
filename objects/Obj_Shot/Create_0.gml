/// CREATE EVENT

damage = 1;

// make sure the bullet never animates
image_speed = 0;

// default offset if not set by the weapon
if (!variable_instance_exists(id, "angle_offset")) {
    angle_offset = 0;
}

// fake angle for drawing (REAL FIX)
image_angle_ = direction + angle_offset;
