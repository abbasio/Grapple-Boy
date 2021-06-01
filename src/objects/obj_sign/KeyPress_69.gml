/// @description Start text

#region//---------GENERATE TEXT
if (point_in_circle(obj_player.x, obj_player.y, x, y, 64)) && (!instance_exists(obj_text)) //If the player is within a circle of 64 radius from the sign, and no text object currently exists
{                                                          
		with (instance_create_layer(x, y - 64, layer, obj_text)) //Establishes the position and layer for the text object
		{
			text = other.text; //Sets the text to the text specified in the text object (or the signs creation code)
			length = string_length(text); //Sets length of the string to equal the length of the specified text
		}
		
		with (obj_camera)
		{
			follow = other.id; //Focuses camera on the text
		}
}	

#endregion