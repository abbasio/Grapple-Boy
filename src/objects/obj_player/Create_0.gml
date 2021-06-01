#region//---------PLAYER

hsp = 0;  //A variable for the default horizontal speed of the player

vsp = 0;  //A variable for the default vertical speed of the player

grav = 0.5;  //A variable for gravity, a modifier for vertical speed

walk_speed = 4;  //A variable for walk speed, a modifier for horizontal speed

walk_acceleration = 1.5;

ground_friction = 0.5;

air_friction = 0.2;

jump_speed = 8 //A variable for jump speed, a modifier for vertical speed

jumps = 0; //A variable for the stored number of jumps available 

jumps_max = 2; //A variable for the maximum number of allowed jumps

hascontrol = true; //A variable for whether the player has control or not

grapple_length = 90; //A variable for the length of the grappling hook

can_grapple = 0;

state = states.normal; //A variable for the initial state of the player

#endregion

#region//---------CONTROLLER

gamepad_set_axis_deadzone(0, 0.2) //Sets a deadzone for the controller

window_set_cursor(cr_none);

#endregion

#region//---------STATES
enum states 
{
	normal,
	swing,
	death
}

#endregion