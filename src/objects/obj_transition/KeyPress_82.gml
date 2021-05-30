/// @description Restarts Room

with(obj_player) 
if(hascontrol) 
{
	hascontrol = false;
	SlideTransition(transition_mode.DEATH); //Switches to restart mode when the R key is pressed
}