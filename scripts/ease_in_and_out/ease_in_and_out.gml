function ease_in_and_out(){
/// ease_in_and_out(time, start, change, duration)
var t = argument0; // current time
var b = argument1; // starting value
var c = argument2; // change (dest - start)
var d = argument3; // duration

// cubic ease-in-out
t /= d/2;
if (t < 1) {
    return c/2*t*t*t + b;
} else {
    t -= 2;
    return c/2*(t*t*t + 2) + b;
}

}