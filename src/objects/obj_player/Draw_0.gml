///@desc Grappling hook

#region//---------DRAW GRAPPLE

if (key_grapple) || state = states.swing
{
	draw_set_color(c_blue);
	draw_line_width(grapple_x, grapple_y, rope_x, rope_y, 2); 
}

draw_self(); 

#endregion