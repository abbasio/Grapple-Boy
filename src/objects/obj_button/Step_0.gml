/// @desc MOUSE HOVER

#region//---------VARIABLES
var _hover = CheckHover(); //Variable for if the mouse is over a button - see Scripts>CheckHover
var _click = _hover && mouse_check_button_pressed(mb_left); //Variable for if the mouse is over button, and left mouse is clicked
#endregion

#region//---------BUTTON ANIMATION
hover = lerp(hover, _hover, 0.1); //Smoothly moves the 'hover' variable from 0 to 1, if _hover is 'true', by increments of 10%.
y = lerp(y, ystart - _hover * 8, 0.1); //Smoothly moves the y position of the button up a small amount, by increments of 10%
//See 'lerp' in Gamemaker Studio 2 manual for more information
#endregion

#region//---------EXECUTE SCRIPT
if (_click && script >= 0) //If the button is clicked, and no script has been run
{
	script_execute(script); //Execute the specified script - see Scripts>CreateButton
}
#endregion