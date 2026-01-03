/// scrERandomInit — simplified for your project

// Enemy idle / random wandering initialization
reload = 15;
alert = 0;
checkreload = irandom(30);

// Movement & direction
speed = 1;  // or random between 1 and 2 if you want some variance
direction = irandom(359);

// Clear any existing path (if you use path-based movement)
// If you don't use paths, you can skip these two lines
/*
path = path_add();
path_set_closed(path, false);
*/

// Schedule random behavior (if you implement Alarm[0] logic)
alarm[0] = 60 + irandom(90);

// Other flags
returning = false;
armed = true;
