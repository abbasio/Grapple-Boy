///@desc Grappling hook

#region//---------DRAW GRAPPLE

if (key_grapple) || state = states.swing //If the grapple key is pressed, or if we are in a swing state
{
	draw_set_color(c_blue); //Set the color of the grappling hook (in this case, blue)
	draw_line_width(grapple_x, grapple_y, rope_x, rope_y, 2); //Draws a line between the player and the grapple point, with a width of 2 pixels
}

draw_self(); //Draws the player sprite itself

#endregion