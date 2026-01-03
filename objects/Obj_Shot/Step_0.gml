 /// STEP EVENT

// keep visual rotation synced with direction
image_angle_ = direction + angle_offset;

// destroy bullet when it hits a wall
if (place_meeting(x, y, obj_wall)) {
    instance_destroy();
}
 