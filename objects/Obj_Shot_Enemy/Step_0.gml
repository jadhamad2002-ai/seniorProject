/// Obj_Shot_Enemy Step

image_angle_ = direction + angle_offset;

if (place_meeting(x, y, obj_wall)) {
    instance_destroy();
}
