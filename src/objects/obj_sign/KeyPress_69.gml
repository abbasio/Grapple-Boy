/// @description Insert description here



if (point_in_circle(obj_player.x, obj_player.y, x, y, 64)) && (!instance_exists(obj_text)) //If the player is within the circle
{                                                          //Circle is a radius of 64 pixels around the sign
		with (instance_create_layer(x, y - 64, layer, obj_text)) 
		{
			text = other.text; //Sets the text to the selected sign's text
			length = string_length(text); //Sets length of string length
		}
		
		with (obj_camera)
		{
			follow = other.id; //Focuses camera on signpost
		}
}