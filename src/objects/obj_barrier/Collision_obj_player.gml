/// @description Insert description here
// You can write your code in this editor

with (obj_player)
{
	grapples = 0;
	if (state = states.swing)
	{
		audio_play_sound(snd_barrier, 2, false);
		state = states.normal;
	}
}