/// @description Draw black bars

if (mode != transition_mode.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, w, percent*h_half, false); //Draws a filled-in black rectangle from the top of the screen
	draw_rectangle(0, h, w, h - (percent * h_half), false); //Draws a filled-in black rectangle from the bottom of the screen
}

