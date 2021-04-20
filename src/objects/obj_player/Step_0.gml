//Personal note: set more variables!
//For example: Instead of constantly doing collision checks for being on the floor, set a variable "onthefloor = 1" if the player is colliding with floor

//---------PLAYER INPUT

// Read keyboard or gamepad values

key_left = keyboard_check(ord("A")) || (gamepad_axis_value(0,gp_axislh)<0);				// Returns a float, 0 or 1
key_right = keyboard_check(ord("D")) || (gamepad_axis_value(0,gp_axislh)>0);			// Returns a float, 0 or 1
key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0,gp_face1));		// Returns a bool, false or true
//key_dash = keyboard_check_pressed(vk_shift) || (gamepad_button_check_pressed(0,gp_face2));
key_grapple = mouse_check_button_pressed(mb_left) || (gamepad_button_check_pressed(0,gp_shoulderrb));
key_release = mouse_check_button_pressed(mb_right) || (gamepad_button_check_pressed(0,gp_shoulderlb));

//dash_duration = max(dash_duration - 1, 0);

//---------MOVEMENT
	
	var _move = key_right - key_left;	// Direction of movement
	hsp = _move * walk_speed;			// Speed of horizontal movement
	vsp = vsp + grav;					// Apply gravity
	
//---------DASH

//if(key_dash)
//{
	//dash_duration = 10;
	//hsp = dash_spd; 
	//vsp = 0;
//}


//---------GRAPPLE

if (key_grapple) && (position_meeting (mouse_x, mouse_y, obj_wall))
{
	grappleX = mouse_x;
	grappleY = mouse_y;
	ropeX = x;
	ropeY = y;
	ropeAngleVelocity = 0;   //Speed of swing
	ropeAngle = point_direction(grappleX, grappleY, x, y);  //Angle from wherever we are to wherever we click
	ropeLength = point_distance(grappleX, grappleY, x, y); //Length of rope
	state = states.swing
}

switch (state)
{
	case states.normal: 
		PlayerStateFree(); 
		break;
	case states.swing: 
		PlayerStateSwing(); 
		break;
}

//---------HORIZONTAL COLLISION

// place_meeting checks if location will overlap,
// x and y denote position of the player object.
if (place_meeting(x + hsp, y, obj_wall))			// Imminent collision
{
	// Without the 'while' statement below, the player will 
	// be forced to stop before actually reaching the wall
	// if distance(player, wall) < hsp

	// ! is "not" - place_meeting is collision,
	// !place_meeting is no collision
	// sign(hsp) = 1 or -1
	while (!place_meeting(x + sign(hsp), y, obj_wall))		// While not colliding (but collision is imminent)
	{
		x += sign(hsp);									// _move 1 unit towards wall.
		image_angle = 0;
	}
	
	if (state == states.swing)
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y);
		ropeAngleVelocity = 0;
	}
	// Player has truly collided with wall
	hsp = 0;		// Set player speed to 0

	// Hadi's note- having loops in per-frame logic is usually bad.
	// It won't be a problem in a game like this- ie, 2d & small sprites
	// As an advanced exercise, try to replace the loop with arithmetic
	// Same for vertical collision
}

x += hsp

// The x coordinate of the player sprite is equal to the current x
// coordinate of the player + the horizontal speed.
// The horizontal speed is above defined as _move * walk_speed
// OR zero, if colliding


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


//---------END OF ROOM

if (place_meeting(x + hsp, y + vsp, obj_goal))
{
	room_goto_next()
}

//---------DEATH

if (place_meeting(x + hsp, y + vsp, obj_spike))		// If colliding with a spiked object
{
	room_restart();										// Restart room
}