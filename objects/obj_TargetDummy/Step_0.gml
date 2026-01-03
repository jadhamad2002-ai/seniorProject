timer--;

if(timer <=0){
	Obj_camera.target = Obj_Player;
	instance_destroy();
}