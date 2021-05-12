///@desc Grappling hook


//---------DRAW GRAPPLE

if (state == states.swing) //If the player is in the swing state 
{
	draw_line_width(grappleX, grappleY, ropeX, ropeY, 2) //Draw a line between the player and the cursor position
}

draw_self(); //Draws the line according the the properties defined above