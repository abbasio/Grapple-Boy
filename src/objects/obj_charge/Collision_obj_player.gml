/// @desc CHARGE GRAPPLE

with(obj_player)
{
	audio_play_sound(snd_charge, 2, false);
	grapples = grapples_max;
}

instance_destroy();


