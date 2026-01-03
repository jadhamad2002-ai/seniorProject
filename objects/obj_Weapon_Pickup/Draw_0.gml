


if(Obj_Control.debug == true){
	
	draw_sprite(mask_index,0,x,y);
	
}
draw_self();


draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_xscale, image_angle, c_gray, 0.6);
draw_sprite_ext(sprite_index, 0, x - hover, y - hover, image_xscale, image_xscale, image_angle, c_white, 1);
