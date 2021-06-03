/// @description Insert description here
// You can write your code in this editor

with (obj_player)
{
	if (grapples > 0) && (!on_ground)
	{
		audio_play_sound(snd_barrier, 2, false);
	}
	
	grapples = 0;
	
	if (state = states.swing)
	{
		audio_play_sound(snd_barrier, 2, false);
		state = states.normal;
	}
}