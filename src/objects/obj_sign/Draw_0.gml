/// @desc Notification

#region//---------SIGN PROMPT
if (point_in_circle(obj_player.x, obj_player.y, x, y, 64)) && (!instance_exists(obj_text)) //If the player is within a 64 pixel radius circle of the sign, and a text object doesn't already exist
{
	DrawSetText(c_black, f_sign, fa_center, fa_top) //Draws text based on set parameters - see Scripts>DrawSetText
	draw_text(x, y - 50, "[E]"); //Draws an [E] above the signpost
}
#endregion

draw_self(); //Draws the sign