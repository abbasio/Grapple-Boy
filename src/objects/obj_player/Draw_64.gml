/// @description Insert description here
// You can write y	our code in this editor
if (state = states.swing) 
{
	
	draw_text(bbox_left, bbox_top-300, "Grapple Point: "+string(grapple_point));
	draw_text(bbox_left, bbox_top-350, "GrappleX: "+string(ropeX));
	draw_text(bbox_left, bbox_top-400, "GrappleY: "+string(ropeY));
}
else
	{
		draw_text(bbox_left, bbox_top-450, "position X "+string(x));
		draw_text(bbox_left, bbox_top-500, "position y "+string(y));
	}