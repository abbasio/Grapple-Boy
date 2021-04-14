function PlayerStateFree()
{
	///---------DOUBLE JUMP
	
	
	if (place_meeting(x, y + 1, obj_wall))	    //if player is on the ground
	{
		jumps = jumps_max;                      //max number of jumps are available
	}
	if ((jumps > 0) && key_jump)			    //if jump key is pressed
	{										  		
		jumps -= 1						        //reduce number of available jumps
		vsp = -jump_speed;
	}
	

	
	

///---------CURRENT STATUS

//onground = place_meeting(x,y+1,obj_wall);
//if(onground) jumpbuffer = 6;
	
	
	///--------This code is for rotating a square sprite on jump, which will be unnecessary when we have an actual sprite for the player character.
	
	
	//if (!place_meeting(x, y, (obj_wall || obj_wall)))
	//{
		//if (key_right > 0)
		//{
			//image_angle -=10;
		//}
		//if (key_left > 0)
		//{
			//image_angle +=10;
		//}
		//if (keyboard_check_released(vk_left || vk_right)) //|| (_haxis = 0)
		//{
			//image_angle = 0
		//}
	//}
}

