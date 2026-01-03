/// melee child Create

/// melee child Create
event_inherited(); // keep parent setup

// set which sprite to use for the body+gun
enemy_body_sprite = spr_EWalkknife; // <-- put your melee body sprite here
weapon            = "knife";   // ADD THIS

// override only what melee needs
can_shoot    = false;
melee_speed  = 2.5;

alert_range  = 400;
attack_range = 24;   // when to switch to attack state
melee_range  = 28;   // hit distance

attack_time  = room_speed * 0.4;
attack_timer = attack_time;
/// melee child Create
