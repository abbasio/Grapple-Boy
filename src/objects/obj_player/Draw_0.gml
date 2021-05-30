///@desc Grappling hook

#region//---------DRAW GRAPPLE

if (key_grapple) || state = states.swing
{
	draw_set_color(c_blue);
	draw_line_width(grappleX, grappleY, ropeX, ropeY, 2); 
}

draw_self(); 

#endregion