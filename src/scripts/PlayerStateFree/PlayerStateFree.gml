function PlayerStateFree()
{
	///---------DOUBLE JUMP
	
	
	if (place_meeting(x, y + 1, obj_wall))	    //If player is on the ground
	{
		jumps = jumps_max;                      //The max number of jumps are available
	}
	if ((jumps > 0) && key_jump)			    //If the jump key is pressed
	{										  		
		jumps -= 1						        //Then reduce number of available jumps
		vsp = -jump_speed;
	}
	
	
//---------ANIMATION

if(!place_meeting(x, y + 1, obj_wall)) //If the player is not colliding with any wall (ie: is in the air)
{
	sprite_index = spr_jumping; //Switch to the jumping sprite
	image_speed = 0; //Prevent animation
	if(sign(vsp) > 0) image_index = 1; else image_index = 0; //If the player is going up, use the first frame of the animation
															 //Otherwise, use the second frame of the animation
	
}
else //When the player is on the ground
{
	if (sprite_index == spr_jumping) audio_play_sound(snd_landing,2,false);
	image_speed = 1; //Allows animation
	if (hsp == 0)  //If the player is still
	//Note: double equals is for checking whether something is equal to 0, single equals is for assigning a value of 0
	{
		sprite_index = spr_player; //Use the regular player sprite
	}
	else //When the player is in motion
	{
		sprite_index = spr_running; //Use the running sprite 
		
	}

if (hsp != 0) image_xscale = sign(hsp); //Switches the direction of the player sprite based on which direction the player is moving

}


}

