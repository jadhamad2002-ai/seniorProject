
    var pickup = instance_create_layer(x, y, "Instances", obj_Weapon_Pickup);
    pickup.sprite_index = sprite_index;
	pickup.ammoPickup = ammoThrow;
	
    instance_destroy();

