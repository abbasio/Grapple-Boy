/// @description Update Camera

#region//---------UPDATE DESTINATION 

if (instance_exists(follow)) //If there is a player object in existence 
{
	x_toward = follow.x //Returns x coordinate of 'follow'
	y_toward = follow.y //Returns y coordinate of 'follow'
}

#endregion

#region//---------UPDATE OBJECT POSITION

x += (x_toward - x) / 25; //Moves the x value of the camera from its current location to desired destination
y += (y_toward - y) / 25; //Moves the y value of the camera from its current location to desired destination

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