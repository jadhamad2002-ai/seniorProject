// hover
if (time < duration) {
    hover = ease_in_and_out(time, start, dest - start, duration);
    time++;
} else {
    var temp_Start = start;
    start = dest;
    dest = temp_Start;
    time = 0;
}
