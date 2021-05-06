/// @description Move to next room

with (obj_player) //When the player meets the goal
{
	if (hascontrol) //see 'hascontrol' in the player object
	{
		hascontrol = false; //Removes control from player during the transition
		SlideTransition(transition_mode.GOTO,other.target); //Transitions to 'target' room specified in the creation code of the goal object
	}
}