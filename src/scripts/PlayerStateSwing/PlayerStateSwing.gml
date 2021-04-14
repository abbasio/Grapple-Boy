// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateSwing()
{
	var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle);	//Defines how quickly player is accelerating along angles of pendulum's circle. dcos defines cosine, using degrees. NOTE: Replace -0.2 with variable
	ropeAngleVelocity += _ropeAngleAcceleration;			//Rope velocity is equal to the intial velocity (0) plus the acceleration
	ropeAngle += ropeAngleVelocity;							//Changes rope angle
	
	//ropeAngleVelocity *= 0.99; //Dampener - we slowly reduce velocity at the top/bottom, represents air friction. Can remove.
	
	// Defines end of rope movement
	ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle); 
	ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);
	
	// Move char
	hsp = ropeX - x; 
	vsp = ropeY - y;
	
	state = key_release ? states.normal : state;	// If mouse check button pressed, state = states.normal, otherwise state is unchanged
}