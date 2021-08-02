function PlayerStateFree()
{
	
#region //---------MOVEMENT

if (place_meeting(x, y + 1, obj_wall)) 
{
	on_ground = true;
}
else
{
	on_ground = false;
}

if (on_ground) && place_meeting(x, y, obj_ice) 
{
	on_ice = true;
}
else
{
	on_ice = false;
}

	
var _move = key_right - key_left;	// Direction of movement
hsp += _move * hsp_acc;
if (_move == 0)
{
	var _friction = ground_friction;
	if (!on_ground) _friction = air_friction
	if (on_ground) && (on_ice)
	{
		_friction = ice_friction
	}
	
	hsp = Approach (hsp, 0, _friction)
}


if(!on_ground)
{
	
	hsp = clamp(hsp, -hsp_max, hsp_max);
}
else
{
	if (on_ice)
	{
		hsp = clamp(hsp, -hsp_ice, hsp_ice);
	}
	else
	{
		hsp = clamp(hsp, -walk_speed, walk_speed);
	}
}

hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;

vsp = vsp + grav;					// Applies the gravity modifier to the vertical movement 


#endregion
	
#region	//---------DOUBLE JUMP
	
	if (on_ground)							    //If player is on the ground
	{
		grapples = grapples_max;
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
	audio_play_sound(snd_bounce, 6, false);
	vsp = -vsp * 1.5;
	grapples = grapples_max;
	jumps = 1;
}
#endregion

#region//---------SPEED CAP

vsp = clamp(vsp, -15, 15);

#endregion

#region	//---------ANIMATION

if(!on_ground) //If the player is not on the ground (ie: is in the air)
{
	sprite_index = spr_jumping; //Switch to the jumping sprite
	image_speed = 0; //Prevent animation
	image_index = (sign(vsp) > 0);
	
	if (hsp != 0)
	{
		image_xscale = sign(hsp);
	}
	
	if(sign(vsp) > 0) //If the player is going up
	{
		image_index = 1; //Use the first frame of animation
	}
	else 
	{
		image_index = 0; //Otherwise, use the second frame of animation
	}	
	
}
	else //When the player is on the ground
	{
		image_speed = 1; //Allows animation
		
		if (sprite_index == spr_jumping) //If the current player sprite is equal to the jumping sprite
		{								
			audio_play_sound(snd_landing,2,false); //Play the landing sound
		}
			
		if (hsp == 0)	//If the player is not moving horizontally
		{				//Note: double equals is for checking whether something is equal to 0, single equals is for assigning a value of 0
			sprite_index = spr_player; //Use the regular player sprite
		}
		else //When the player is in motion
		{
			image_xscale = sign(hsp);
			sprite_index = spr_running; //Use the running sprite 
		
		}
	}
#endregion

}
