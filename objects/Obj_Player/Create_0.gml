/// Obj_Player Create

walkSpeed      = 2;    // already there
sprintSpeed    = 3.5;  // how fast when sprinting
is_sprinting   = false;

is_dead = false;

// === HEALTH ===
hp = 3; // 3 hits to die

is_dead = false;

camera_offset_x = 0;
camera_offset_y = 0;


walk_Frame = 0;
walk_FrameSpeed = 0.3;
move_dir = 0;
dummyTarget = noone;

weapon_sprite = spr_Pwalk_Unarmed; // full‑body

weapon = "unarmed";
weapon_locked = false;

ammoPlayer = 0;

// shooting / attack control
shoot_timer  = 0;
attack_timer = 0;

// attack sprites:
spr_attack_pistol   = spr_PAttackpistol;
spr_attack_rifle    = spr_PAttackrifle;
spr_attack_mp5      = spr_PAttackmp5;
spr_attack_shotgun  = spr_PAttackshotgun;

spr_attack_pipe     = spr_PAttackpipe;
spr_attack_knife    = spr_PAttackknife;

image_angle_ = 0;

// activate Ai of enemies
ai_Refresh      = 10;
alarm[0]        = ai_Refresh;
ai_Circle_Range = 100;

// === HEALTH ===
hp = 3; // 3 hits to die
