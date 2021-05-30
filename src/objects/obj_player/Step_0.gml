if(global.pause) exit;

#region //---------PLAYER INPUT

if (hascontrol) //If the player has control
{
	key_left = keyboard_check(ord("A")) || (gamepad_axis_value(0, gp_axislh) < 0);				// Establishes 'A' or left on the joystick as the left key
	key_right = keyboard_check(ord("D")) || (gamepad_axis_value(0, gp_axislh) > 0);			// Establishes 'D' or right on the joystick as the right key
	key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0, gp_face1));	//Establishes 'space' or the bottom face button as the jump key	
	key_grapple = mouse_check_button_pressed(mb_left) || (gamepad_button_check_pressed(0, gp_shoulderrb)); //Establishes left mouse click or right shoulder button as the grapple key
	key_release = mouse_check_button_pressed(mb_right) || (gamepad_button_check_pressed(0, gp_shoulderlb)); //Establishes right mouse click or left shoulder button as the grapple release key
}
else //When the player does not have control
{
	key_right = 0
	key_left = 0
	key_jump = 0
	key_grapple = 0
	key_release = 0
}

#endregion

#region //---------STATES

switch (state) //Switches the state of the player 
{
	case states.normal: //If the player is in the normal state 
		PlayerStateFree(); //Execute the script 'PlayerStateFree'
		break; //Ends loop
	case states.swing: //If the player is in the swing state 
		PlayerStateSwing(); //Execute the script 'PlayerStateSwing'
		break; //Ends loop
	case states.death: //If the player is in the death state
		PlayerStateDeath(); //Execute the script 'PlayerStateDeath'
		break; //Ends loop
} 

#endregion

#region //---------GRAPPLE

if (key_grapple) && (state != states.swing) //If the grapple key is pressed, and we are not already in a swing state
{
	grappleX = x + (grapple_length * image_xscale); //Establishes the x position of the rope end point, at an angle in front of the player's position
	grappleY = y - (grapple_length); //Establishes the y position of the rope end point  
	ropeX = x; //Establishes the x position of the rope origin at the x position of the player
	ropeY = y; //Establishes the y position of the rope origin at the y position of the player
	ropeAngle = point_direction(grappleX, grappleY, ropeX, ropeY);  //Angle from wherever we are to wherever we click
	ropeLength = point_distance(grappleX, grappleY, ropeX, ropeY); //Length of rope
	ropeAngleVelocity = (sqrt(sqr(hsp) + sqr(vsp)) * image_xscale) / 2;   //Speed of swing 
	grapple_point = collision_line(ropeX, ropeY, grappleX, grappleY, obj_wall, true, true)
	
	
	if (grapple_point) 
	{
		gp_x = grapple_point.x
		gp_y = grapple_point.y
		ropeX = x;
		ropeY = y;
		//ropeAngle = point_direction(gp_x, gp_y, ropeX, ropeY);
		//ropeLength = point_distance(gp_x, gp_y, ropeX, ropeY);
		ScreenShake (2,10); //Shakes the screen by 2 pixels for 10 frames
		audio_play_sound(snd_grapple, 5, false); //Plays the grapple sound
		state = states.swing; //Switches to the swing state - see Scripts>PlayerStateSwing
	}
	else
	{
		state = states.normal;
	}
}

#endregion

#region //---------COLLISIONS


//---------HORIZONTAL COLLISION

// place_meeting checks if location will overlap,
// x and y denote position of the player object.
if (place_meeting(x + hsp, y, obj_wall))			// If there will be an imminent collision
{
	// Without the 'while' statement below, the player will be forced to stop before actually reaching the wall
	// ! is "not" - place_meeting is collision, !place_meeting is no collision
	// sign(hsp) will equal either 1 or -1
	while (!place_meeting(x + sign(hsp), y, obj_wall))		// While not colliding (but collision is imminent)
	{
		x += sign(hsp);										// Move 1 unit towards wall.
		image_angle = 0;
	}
	
	if (state == states.swing) //If the player is in the swing state 
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y); //Establishes direction of rope
		ropeAngleVelocity = 0; //Sets the swing speed to zero
	}
	
	hsp = 0;		// Set player speed to 0

}

x += hsp // The x coordinate of the player sprite is equal to the current x coordinate of the player + the horizontal speed.

// The horizontal speed is above defined as _move * walk_speed OR zero, if colliding


//---------VERTICAL COLLISION

//Same as the horizontal collision code, except for y values instead of the x values.

if (place_meeting(x, y + vsp, obj_wall))
{
	while (!place_meeting(x, y + sign(vsp), obj_wall))
	{
		y += sign(vsp);	
		
	}
	if (state == states.swing)
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y);
		ropeAngleVelocity = 0;
	}
	
	vsp = 0;	
}


y += vsp;
#endregion


