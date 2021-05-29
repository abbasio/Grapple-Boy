/// @desc Notification
if (point_in_circle(obj_player.x, obj_player.y, x, y, 64)) && (!instance_exists(obj_text))
{
	DrawSetText(c_black, f_sign, fa_center, fa_top)
	draw_text(x, y - 50, "[E]");
}

draw_self();