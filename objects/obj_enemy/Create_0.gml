// CREATE EVENT (obj_enemy) - PARENT
paused = false;

hp    = 1;          // or higher if you want tougher enemies
state = "alive";    // reuse your existing state name if needed

last_hit_weapon = noone; // for death animation/type later if you want

// LEGS ONLY
sprite_index = spr_ELegsWalk;
image_speed  = 1;
image_angle_ = 0;

leg_angle = 0;

// default values (children override these)
weapon            = "none";
enemy_body_sprite = spr_ELegsWalk; // fallback
can_shoot         = false;
melee_range       = 40;

// ai state machine 
sightMAX     = 400;
state        = "idle";
//emote_Index  = 0;

// emote
//emote = instance_create_layer(x, y - 15, layer, obj_Enemy_State_Emote);
//emote.instanceToFollow = id;

// pathfinding
path             = path_add();
position_Start_X = x;
position_Start_Y = y;
position_Target_X = x;
position_Target_Y = y;

walkSpeed_Checking = 1.5;
walkSpeed_Aggro    = 2;
melee_speed = 2;

ai_NothingHere_time   = 180;
ai_NothingHere_timer  = ai_NothingHere_time;
ai_I_See_you          = 10;
ai_I_See_you_Angle    = 20;

attackRange      = 50;
attackRangeBreak = 200;

attack_time  = 60;
attack_timer = attack_time;

// how far they see / attack
alert_range  = 400;
attack_range = 120;

