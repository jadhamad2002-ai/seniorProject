/// obj_MeleeHitbox Create

if (!variable_instance_exists(id, "owner"))       owner       = noone;
if (!variable_instance_exists(id, "weapon_type")) weapon_type = "";

life = 15; // was 3, now longer so slow swing can still hit
