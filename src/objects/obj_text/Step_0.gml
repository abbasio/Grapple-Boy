/// @description Progress text

//---------REMOVE PLAYER CONTROL

with (obj_player) 

if (hascontrol) 
{
	hascontrol = false;
}

//---------LETTER MOVEMENT

letters += spd; //Number of letters visible increases by spd variable

if (keyboard_check(vk_anykey)) //If any key is held down
{
	letters += (2 * spd) //Text speed increases by 2x
}

text_current = string_copy(text, 1, floor(letters)); //Sets the current text to be 1 letter from the 'letters' string

draw_set_font(f_sign); //Sets the font for the signpost

if (h==0) h = string_height(text); //Sets height of the text
w = string_width(text_current); //Sets width of the box equal to the total width of current text


#region//---------DESTROY
if (letters >= length) && (keyboard_check_pressed(vk_anykey)) //Once the entire text is displayed and the player presses any key
{
	with (obj_player) //Restores control to player once text box is gone
	if (!hascontrol)
	{
		hascontrol = true
	}
	instance_destroy(); //Destroy the text instance
	with(obj_camera) follow = obj_player; //Set the camera to follow the player again
}
#endregion