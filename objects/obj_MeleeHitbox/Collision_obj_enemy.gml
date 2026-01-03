/// obj_MeleeHitbox Collision with obj_enemy

if (weapon_type == "pipe") {
    other.hp -= Obj_Control.damage_pipe;
} else if (weapon_type == "knife") {
    other.hp -= Obj_Control.damage_knife;
}

// optionally remember last weapon type
other.last_hit_weapon = weapon_type;

instance_destroy();
