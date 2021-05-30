/// @description Quit Game
with(obj_player) 
if(hascontrol) 
{
	hascontrol = false;
	SlideTransition(transition_mode.RESTART); //Switches to restart mode when the R key is pressed
}
