/*/// Alarm 0
if (increase) {
    draw_Extra++;
    if (draw_Extra >= draw_ExtraMax) increase = false;
} else {
    draw_Extra--;
    if (draw_Extra <= 0) { draw_Extra = 0; increase = true; }
}
alarm[0] = animateTime;
