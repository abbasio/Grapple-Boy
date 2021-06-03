///@desc Player Death
//This function is to establish what happens when the player dies


function PlayerStateDeath() {

#region//---------EFFECTS
if (hascontrol) //If the player currently has control
{
	hascontrol = false; //Remove control
	hsp = 0;
	vsp = 0;
	sprite_index = spr_death; //Change the player sprite to the death sprite
	image_speed = 1; //Enable animation
	audio_play_sound(snd_death,10,false); //Play the death sound 
	ScreenShake (25,60); //Shake the screen by 30 pixels for 60 frames		
}
#endregion

#region///---------TIMER

if (alarm[0] == -1)  //If the alarm is off
{
	alarm = (room_speed * 1); //Turn the alarm on, and set it to 1 second
}
#endregion

#region//---------ANIMATION

if (image_speed > 0) && (image_index > image_number - 1) //If the sprite is animated and on the last frame
{
	image_speed = 0; //Disable animation
}
#endregion

}