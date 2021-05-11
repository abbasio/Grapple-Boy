///@desc Player Death

function PlayerStateDeath(){

if (hascontrol)
{
		hascontrol = false;
		sprite_index = spr_death;
		image_speed = 1;
		audio_play_sound(snd_death,10,false);
		ScreenShake (30,30);
		if (alarm[0] = -1) alarm = (room_speed * 1);
}

if (image_speed > 0)
		{
			if (image_index > image_number - 1) image_speed = 0;
		}

}