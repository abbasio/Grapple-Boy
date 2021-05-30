/// @description Insert description here
// You can write your code in this editor

if (state = states.swing) 
{
	draw_set_color(c_red);
	draw_text(bbox_left, bbox_top-300, "swing speed: "+string(ropeAngleVelocity));
}