#region//---------PLAYER

hsp = 0;  //A variable for the default horizontal speed of the player

vsp = 0;  //A variable for the default vertical speed of the player

hsp_frac = 0;

vsp_frac = 0;

grav = 0.5;  //A variable for gravity, a modifier for vertical speed

walk_speed = 5.5;  //A variable for walk speed, a modifier for horizontal speed

hsp_acc = 1.5; //A variable for the horizontal acceleration of the player

hsp_max = 6.5; //A variable for the maximum horizontal speed of the player

ground_friction = 0.5; //A variable for ground friction

air_friction = 0.2; //A variable for air friction

jump_speed = 8 //A variable for jump speed, a modifier for vertical speed

jumps = 0; //A variable for the stored number of jumps available 

jumps_max = 2; //A variable for the maximum number of allowed jumps

hascontrol = true; //A variable for whether the player has control or not

grapple_length = 120; //A variable for the length of the grappling hook

grapples = 0;

grapples_max = 2;

state = states.normal; //A variable for the state of the player

#endregion

#region//---------CONTROLLER

gamepad_set_axis_deadzone(0, 0.2) //Sets a deadzone for the controller

window_set_cursor(cr_none); //Removes cursor

#endregion

#region//---------STATES

enum states //Establishes the number of states
{
	normal, //'Normal' state - see Scripts>PlayerStateFree
	swing, //'Swing' state - see Scripts>PlayerStateSwing
	death //'Death' state - see Scripts>PlayerStateDeath
}

#endregion