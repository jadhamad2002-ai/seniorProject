function src_SetAngle(){

var angleSet = image_angle_;
var faceMinus = abs(image_angle_ - direction);
if(faceMinus >180){
	
	if(image_angle_ > direction ){ angleSet = -1* ((360 - image_angle_) +direction);}
	else { angleSet = (360 - image_angle_) + direction;}
	
}

angleSet = clamp(angleSet,0,359);

image_angle_ = lerp(angleSet,direction,0.1);

}