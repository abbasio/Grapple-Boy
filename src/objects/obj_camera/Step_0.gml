/// @description Update Camera



#region//---------UPDATE DESTINATION 

if (instance_exists(follow)) //If there is a player object in existence 
{
	x_toward = follow.x //Returns x coordinate of 'follow'
	y_toward = follow.y //Returns y coordinate of 'follow'
}

#endregion

#region//---------UPDATE OBJECT POSITION

x += (x_toward - x) / 10; //Moves the x value of the camera from its current location to desired destination
y += (y_toward - y) / 10; //Moves the y value of the camera from its current location to desired destination

#endregion

#region//---------CLAMP CAMERA

x = clamp(x, view_w_half + buff, room_width - view_w_half - buff); //Prevents camera from moving beyond edge of the room horizontally

y = clamp(y, view_h_half + buff, room_height - view_h_half - buff); //Prevents camera from moving beyond edge of the room vertically

#endregion
#region//---------SCREENSHAKE

x += random_range(-shake_remain, shake_remain);
y+= random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length) * shake_mag)); //Establishes duration of screen shake by constantly reducing the shake_remain each frame

#endregion

#region//---------UPDATE CAMERA VIEW

camera_set_view_pos(cam, x - view_w_half, y - view_h_half); //Places player in center of viewfinder, instead of top left

#endregion

#region//---------PARALLAX

//---------WORLD 1

if (layer_exists(cloud_layer)) //If there is a cloud layer in the background
{
	layer_x(cloud_layer, x / 2);
}

if (layer_exists(mountain_layer))
{
	layer_x(mountain_layer, x / 4);
}

//---------WORLD 2

if (layer_exists(cave_front))
{
	layer_x(cave_front, x / 4);
}

if (layer_exists(cave_mid))
{
	layer_x(cave_mid, x / 3);
}

if (layer_exists(cave_back))
{
	layer_x(cave_back, x / 2);
}

if (layer_exists(cave_beams))
{
	layer_x(cave_beams, x / 1.5);
}

//---------WORLD 3

if(layer_exists(ice_front))
{
	layer_x(ice_front, x / 4);
}

if(layer_exists(ice_mid))
{
	layer_x(ice_mid, x / 3);
}

if(layer_exists(ice_mountain))
{
	layer_x(ice_mountain, x / 1.33);
}

if(layer_exists(ice_back))
{
	layer_x(ice_back, x / 1.2);
}


#endregion