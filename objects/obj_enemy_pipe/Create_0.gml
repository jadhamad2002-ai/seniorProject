/// obj_enemy_pipe Create

event_inherited(); // IMPORTANT: get parent variables [web:387][web:389]

// tank hp
hp = 5;

// melee setup
can_shoot        = false;
weapon            = "pipe";    // ADD THIS
enemy_body_sprite = spr_EWalkpipe; // your pipe body sprite

melee_speed  = 3; // not 0
alert_range  = 400;
attack_range = 24;
melee_range  = 28;

attack_time  = room_speed * 0.4;
attack_timer = attack_time;
