    var grabCamera_Width = camera_get_view_width(view_camera[0])/2;
var grabCamera_Height = camera_get_view_height(view_camera[0])/2;

var buffer_ = 40;

var left = instance_create_layer(grabCamera_Width-buffer_,grabCamera_Height, "Instances_On_Top", Obj_palmtree);
	left.direction= 180;
	left.speed = 1;
	
	var right = instance_create_layer(grabCamera_Width+buffer_,grabCamera_Height, "Instances_On_Top", Obj_palmtreeright);
	right.direction= 0;
	right.speed = 1;
	
alarm_set(0, reset_Time);