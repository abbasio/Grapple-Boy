///@desc Grappling hook

#region//---------DRAW GRAPPLE

if (key_grapple) || (state == states.swing) //If the player is in the swing state 
{
	draw_set_color(c_grey);
	draw_line_width(grappleX, grappleY, ropeX, ropeY, 2); //Draw a line between the player and the cursor position
}

draw_self(); //Draws the line according the the properties defined above

#endregion