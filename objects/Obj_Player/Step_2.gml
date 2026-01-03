// obj_Player End Step
if (attack_timer > 0) {
    // Lock the attack sprite and keep image_speed advancing
    switch (weapon) {
        case "pistol":  sprite_index = spr_PAttackpistol;  image_speed = 1; break;
        case "rifle":   sprite_index = spr_PAttackrifle;   image_speed = 1; break;
        case "shotgun": sprite_index = spr_PAttackshotgun; image_speed = 1; break;
		case "mp5":    sprite_index = spr_PAttackmp5;    image_speed = 1; break;
		
        case "pipe":    sprite_index = spr_PAttackpipe;    image_speed = 1; break;
		case "knife":    sprite_index = spr_PAttackknife;    image_speed = 1; break;
		
    }
    attack_timer--;
} else {
    // Only now reset to idle/walk and set image_speed based on movement
    switch (weapon) {
        case "pistol":  weapon_sprite = spr_walk_pistol;  break;
        case "rifle":   weapon_sprite = spr_walk_rifle;   break;
        case "shotgun": weapon_sprite = spr_walk_shotgun; break;
		case "mp5": weapon_sprite = spr_walk_mp5; break;
		
		
        case "pipe":    weapon_sprite = spr_walk_pipe;    break;
		case "knife":    weapon_sprite = spr_walk_knife;    break;
        default:        weapon_sprite = spr_Pwalk_Unarmed; break;
    }
    sprite_index = weapon_sprite;
    image_speed = ((x != xprevious) || (y != yprevious)) ? 1 : 0;
}
