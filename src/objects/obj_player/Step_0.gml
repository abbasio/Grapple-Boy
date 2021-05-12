//Personal note: set more variables!
//For example: Instead of constantly doing collision checks for being on the floor, set a variable "onthefloor = 1" if the player is colliding with floor

//---------PLAYER INPUT

if (hascontrol) //If the player has control
{
key_left = keyboard_check(ord("A")) || (gamepad_axis_value(0,gp_axislh)<0);				// Establishes 'A' or left on the joystick as the left key
key_right = keyboard_check(ord("D")) || (gamepad_axis_value(0,gp_axislh)>0);			// Establishes 'D' or right on the joystick as the right key
key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0,gp_face1));	//Establishes 'space' or the bottom face button as the jump key	
key_grapple = mouse_check_button_pressed(mb_left) || (gamepad_button_check_pressed(0,gp_shoulderrb)); //Establishes left mouse click or right shoulder button as the grapple key
key_release = mouse_check_button_pressed(mb_right) || (gamepad_button_check_pressed(0,gp_shoulderlb)); //Establishes right mouse click or left shoulder button as the grapple release key
}
else //When the player does not have control
{
	key_right = 0
	key_left = 0
	key_jump = 0
	key_grapple = 0
	key_release = 0

}


//---------MOVEMENT
	
	var _move = key_right - key_left;	// Direction of movement
	hsp = _move * walk_speed;			// Applies the walk speed modifier to the horizontal movement
	vsp = vsp + grav;					// Applies the gravity modifier to the vertical movement 

//---------STATES

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
	
//---------GRAPPLE

if (key_grapple) && (position_meeting (mouse_x, mouse_y, obj_wall)) //If the grapple key is pressed while the cursor is on a wall object
{
	ScreenShake (2,10); //Shakes the screen by 2 pixels for 10 frames
	audio_play_sound(snd_grapple,5,false); //Plays the grapple sound
	grappleX = mouse_x; //Establishes the x position of the rope end point as the x position of the mouse
	grappleY = mouse_y; //Establishes the y position of the rope end point as the y position of the mouse 
	ropeX = x; //Establishes the x position of the rope origin at the x position of the player
	ropeY = y; //Establishes the y position of the rope origin at the y position of the player 
	ropeAngleVelocity = 0;   //Speed of swing
	ropeAngle = point_direction(grappleX, grappleY, x, y);  //Angle from wherever we are to wherever we click
	ropeLength = point_distance(grappleX, grappleY, x, y); //Length of rope
	state = states.swing //Switches to the swing state - see Scripts>PlayerStateSwing
}



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



