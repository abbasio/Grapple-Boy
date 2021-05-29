function PlayerStateSwing()
{
	key_up = keyboard_check(ord("W"));
	key_down = keyboard_check(ord("S"));
	
	var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle);	//Defines how quickly player is accelerating along angles of pendulum's circle. dcos defines cosine, using degrees
	_ropeAngleAcceleration += (key_right - key_left) * 0.08
	ropeLength += (key_down - key_up) 
	ropeAngleVelocity += _ropeAngleAcceleration;			//Rope velocity is equal to the intial velocity (0) plus the acceleration
	ropeAngle += ropeAngleVelocity;							//Changes rope angle
	
	
	ropeAngleVelocity *= 0.99; //Dampener - we slowly reduce velocity at the top/bottom, represents air friction. Can remove.
	
	// Defines end of rope movement
	ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle); 
	ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);
	
	// Move character
	hsp = ropeX - x; 
	vsp = ropeY - y;
	
	if (place_meeting(ropeX + 1, ropeY, obj_boost))
	{
		ropeAngleVelocity = -ropeAngleVelocity * 1.5;
	}
	
	if (key_release)
	{
		state = states.normal // If mouse check button pressed, state = states.normal, otherwise state is unchanged
		jumps = 1;
		hsp = hsp;
		vsp = vsp;
	}
	
		
}