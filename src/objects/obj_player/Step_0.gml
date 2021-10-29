if(global.pause) exit; //If 'pause' is true, freeze all step events - see Objects>obj_pause>Key_Press27.gml

#region //---------PLAYER INPUT

if (hascontrol) //Variable for player control - if 'hascontrol' is true, establish the player controls as follows
	{
		key_left = keyboard_check(vk_left) || (gamepad_axis_value(0, gp_axislh) < 0); // Establishes left arrow key or left on the joystick as the left key
		key_right = keyboard_check(vk_right) || (gamepad_axis_value(0, gp_axislh) > 0); // Establishes right arrow key or right on the joystick as the right key
		key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0, gp_face1));	//Establishes space key or the bottom face button as the jump key	
		key_grapple = keyboard_check_pressed(vk_shift) || (gamepad_button_check_pressed(0, gp_shoulderrb)); //Establishes shift key or right shoulder button as the grapple key
		key_release = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0, gp_shoulderlb)); //Establishes space key or left shoulder button as the grapple release key
	}

else //If 'hascontrol' is false, disable player control
	{
		key_right = 0
		key_left = 0
		key_jump = 0
		key_grapple = 0
		key_release = 0
	}

#endregion

#region //---------STATES

switch (state) //Defines what happens in each player state
{
	case states.normal:		//If the player is in the  normal state 
		PlayerStateFree(); //Execute the script 'PlayerStateFree'
		break;			  //Ends loop
	case states.swing:		 //If the player is in the swing state 
		PlayerStateSwing(); //Execute the script 'PlayerStateSwing'
		break;			   //Ends loop
	case states.death:		 //If the player is in the death state
		PlayerStateDeath(); //Execute the script 'PlayerStateDeath'
		break;			   //Ends loop
} 

#endregion

#region //---------GRAPPLE

if (key_grapple) && (state != states.swing)  //If the grapple key is pressed, and we are not already in a swing state

{
	grapple_x = x + (grapple_length * image_xscale); //Establishes the x coordinate of the rope end point, at an angle in front of the player's position
	grapple_y = y - (grapple_length);				//Establishes the y coordinate of the rope end point, at an angle above the player  
	rope_x = x; //Establishes the x coordinate of the rope origin, at the x position of the player
	rope_y = y; //Establishes the y coordinate of the rope origin, at the y position of the player
	grapple_point = collision_line(grapple_x, grapple_y, rope_x, rope_y, obj_wall, true, true) //Checks to see if an instance of obj_wall exists in the line between (grapple_x, grapple_y and (rope_x, rope_y)
	
	if (grapple_point) && (grapples > 0) //If an instance of obj_wall does exist in that line, and we have grapple charges
	{
		grapples -= 1;
		grapple_x = grapple_point.x //Sets the x coordinate of the rope end point at the x coordinate of the obj_wall instance 
		grapple_y= grapple_point.y //Sets the y coordinate of the rope end point at the y coordinate of the obj_wall instance
		rope_angle = point_direction(grapple_x, grapple_y, rope_x, rope_y); //Establishes the angle of the rope as the angle between the player and the grapple point
		rope_length = point_distance(grapple_x, grapple_y, rope_x, rope_y); //Establishes the length of the rope as the distance between the player and the grapple point
		rope_angle_velocity = (sqrt(sqr(hsp) + sqr(vsp)) * image_xscale);   //Establishes the initial speed of the swing, based on the player's current horizontal and vertical speed
		ScreenShake (2,10); //Shakes the screen by 2 pixels for 10 frames - see Scripts>ScreenShake
		audio_play_sound(snd_grapple, 5, false); //Plays the grapple sound
		state = states.swing; //Switches to the swing state - see Scripts>PlayerStateSwing
	}
	else
	{
		state = states.normal; //If the grapple key isn't pressed, the player is in the normal state - see Scripts>PlayerStateFree
	}
}

#endregion

#region //---------COLLISIONS

//---------HORIZONTAL COLLISION
if (place_meeting(x + hsp, y, obj_wall))//If the player is about to hit a wall, based on the current x position and the current horizontal speed
{
	// Without the 'while' statement below, the player will be forced to stop before actually reaching the wall
	// ! is "not" - place_meeting is collision, !place_meeting is no collision
	// sign(hsp) will equal either 1 or -1
	
	while (!place_meeting(x + sign(hsp), y, obj_wall))//As long as the player has not actually reached the wall yet
	{
		x += sign(hsp); //Move the player by 1 unit towards the wall										
		image_angle = 0; //Prevents sprite from rotating
	}
	
	if (state == states.swing) //If the player is in the swing state 
	{
		rope_angle = point_direction(grapple_x, grapple_y, x, y); //Keeps the rope angle static
		rope_angle_velocity = 0; //Sets the swing speed to zero
	}
	
	hsp = 0; //Set horizontal speed to 0, once the player actually reaches the wall
}

x += hsp //The x coordinate of the player is equal to the current x coordinate of the player + the horizontal speed.

//---------VERTICAL COLLISION

//Same as the horizontal collision code, except for y values instead of the x values.

if (place_meeting(x, y + vsp, obj_wall))//If the player is about to hit a wall, based on the current y position and the current vertical speed
{
	while (!place_meeting(x, y + sign(vsp), obj_wall)) //As long as the player has not actually reached the wall yet
	{
		y += sign(vsp);	//Move the player by 1 unit towards the wall
		
	}
	if (state == states.swing)//If the player is in the swing state 
	{
		rope_angle = point_direction(grapple_x, grapple_y, x, y); //Keeps the rope angle static
		rope_angle_velocity = 0; //Sets the swing speed to zero
	}
	
	vsp = 0; //Set vertical speed to 0, once the player actually reaches the wall	
}

y += vsp; //The y coordinate of the player is equal to the current y coordinate of the player + the vertical speed.
#endregion


