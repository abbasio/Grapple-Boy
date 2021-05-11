/// @description Death

with (obj_player) //When the player meets the spikes
{
	if (hascontrol)
	{
		hsp = 0;
		vsp = 0;
		hascontrol = false;
		ScreenShake (20,20);
		SlideTransition(transition_mode.DEATH); 
	}
}