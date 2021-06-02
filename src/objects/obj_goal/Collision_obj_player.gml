/// @description Move to next room

with (obj_player) //Using code from the player object
{
	if (hascontrol) //If the player has control - see 'hascontrol' in objects>obj_player>step_0.gml
	{
		hsp = 0;
		hascontrol = false; //Removes control from player during the transition
		SlideTransition(transition_mode.GOTO,other.target); //Transitions to 'target' room specified in the goal object's creation code
	}
}