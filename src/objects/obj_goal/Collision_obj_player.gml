/// @description Move to next room

with (obj_player)
{
	if (hascontrol)
	{
		hascontrol = false; //Removes control from player during the transition
		SlideTransition(transition_mode.GOTO,other.target); //Transitions to 'target', room specified in the creation code of the goal object
	}
}