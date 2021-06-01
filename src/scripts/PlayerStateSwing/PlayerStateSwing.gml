function PlayerStateSwing()
{
	key_up = keyboard_check(ord("W"));
	key_down = keyboard_check(ord("S"));
	
	var _rope_angleAcceleration = -0.2 * dcos(rope_angle);	//Defines how quickly player is accelerating along angles of pendulum's circle. dcos defines cosine, using degrees
	_rope_angleAcceleration += (key_right - key_left) * 0.03
	
	
	rope_length += (key_down - key_up) / 2
	if (rope_length < 0)
	{
		rope_length = 0;
	}
	rope_angle_velocity += _rope_angleAcceleration;			//Rope velocity is equal to the intial velocity (0) plus the acceleration
	rope_angle += rope_angle_velocity;							//Changes rope angle
	
	
	
	rope_angle_velocity *= 0.99; //Dampener - we slowly reduce velocity at the top/bottom, represents air friction. Can remove.
	rope_angle_velocity = clamp(rope_angle_velocity, -6, 6);
	
	
	
	// Defines end of rope movement
	rope_x = grapple_x + lengthdir_x(rope_length, rope_angle); 
	rope_y = grapple_y + lengthdir_y(rope_length, rope_angle);
	
	// Move character
	hsp = rope_x - x; 
	vsp = rope_y - y;
	
	if (place_meeting(rope_x + 1, rope_y, obj_boost))
	{
			rope_angle_velocity = -rope_angle_velocity * 2;
	}
	
		
	if (key_release)
	{
		state = states.normal 
		jumps = 1;
		hsp = Approach(hsp, 0, air_friction);
		vsp = vsp;
	}
	
		
}