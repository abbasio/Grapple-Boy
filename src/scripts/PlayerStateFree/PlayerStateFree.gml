function PlayerStateFree()
{
	
#region //---------MOVEMENT
	
var _move = key_right - key_left;	// Direction of movement
hsp += _move * walk_acceleration;			// Applies the walk speed modifier to the horizontal movement
on_ground = (place_meeting(x, y + 1, obj_wall)); 
if (_move == 0)
{
	var _friction = ground_friction;
	if (!on_ground) _friction = air_friction;
	hsp = Approach(hsp, 0, _friction);
}

hsp = clamp(hsp, -walk_speed, walk_speed);

vsp = vsp + grav;					// Applies the gravity modifier to the vertical movement 


#endregion
	
#region	//---------DOUBLE JUMP
	
	if (place_meeting(x, y + 1, obj_wall)) //If player is on the ground
	{
		jumps = jumps_max;                      //The max number of jumps are available
	}
	if ((jumps > 0) && key_jump)			    //If the jump key is pressed
	{										  		
		jumps -= 1						        //Then reduce number of available jumps
		vsp = -jump_speed;
	}
	
#endregion	


#region//---------BOUNCE

if (place_meeting(x, y + 1, obj_boost))
{
	vsp = -vsp * 1.5;
	jumps = 1;
}
//if (place_meeting (x + 1, y, obj_boost))
//{
	//hsp = - hsp;
//}
#endregion

#region//---------SPEED CAP

if (vsp > 10)
{
	vsp = 10;
}
#endregion


#region	//---------ANIMATION

	if(!place_meeting(x, y + 1, obj_wall)) //If the player is not colliding with any wall (ie: is in the air)
	{

		sprite_index = spr_jumping; //Switch to the jumping sprite
		if (hsp != 0)
		{
			image_xscale = sign(hsp);
		}
		image_speed = 0; //Prevent animation
		image_index = (sign(vsp) > 0);
		
		if(sign(vsp) > 0) 
			image_index = 1;
		
		else 
			image_index = 0; //If the player is going up, use the first frame of the animation
																 //Otherwise, use the second frame of the animation
	}
	else //When the player is on the ground
	{
		if (sprite_index == spr_jumping)
			audio_play_sound(snd_landing,2,false);
			
		image_speed = 1; //Allows animation
		
		if (hsp == 0)	//If the player is still
		{				//Note: double equals is for checking whether something is equal to 0, single equals is for assigning a value of 0
			sprite_index = spr_player; //Use the regular player sprite
		}
		else //When the player is in motion
		{
			image_xscale = sign(hsp);
			sprite_index = spr_running; //Use the running sprite 
		
		}

	}

}
#endregion