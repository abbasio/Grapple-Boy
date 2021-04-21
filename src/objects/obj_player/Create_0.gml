

hsp = 0;  //hsp is the horizontal speed of the player

vsp = 0;  //vsp is the vertical speed of the player

grav = 0.5;  //grav is for vertical speed (gravity)

walk_speed = 4;  //walk_speed is for horizontal speed 

jump_speed = 8 //jump_speed is for the vertical speed of jump

jumps = 0; //Stored number of jumps available 

jumps_max = 2; //maximum number of allowed jumps

hascontrol = true;

//dash_spd = 50;

//dash_duration = 0;

gamepad_set_axis_deadzone(0,0.2)

state = states.normal;

controller_angle = 0;

cursor_sprite = spr_cursor;

window_set_cursor(cr_none);
