/// @description Player Death

//The following code executes when the player collides with the spikes

with (obj_player) //Using the code from the player object
{
	state = states.death; //Switch to the death state - see Scripts>PlayerStateDeath
}