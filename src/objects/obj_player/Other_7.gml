/// @description Footsteps

#region//---------FOOTSTEP SOUND

if(sprite_index == spr_running) //If the player is running
	audio_play_sound(choose(snd_foot1, snd_foot2, snd_foot3, snd_foot4), 1, false); //Plays a random footstep sound from a selection, at the last frame of the animation 
#endregion