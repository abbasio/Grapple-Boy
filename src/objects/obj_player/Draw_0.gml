///@desc Grappling hook

#region//---------DRAW GRAPPLE

if state = states.swing
{
	draw_set_color(c_grey);
	draw_line_width(grappleX, grappleY, ropeX, ropeY, 2); 
}

draw_self(); 

#endregion