/// @description Update Camera

//---------UPDATE DESTINATION 

if (instance_exists(follow)) //If there is a player object in existence 
{
	x_toward = follow.x //Returns x coordinate of 'follow'
	y_toward = follow.y //Returns y coordinate of 'follow'
}

//---------UPDATE OBJECT POSITION

x += (x_toward - x) / 25; //Moves the x value of the camera from its current location to desired destination
y+= (y_toward - y) / 25; //Moves the y value of the camera from its current location to desired destination

x = clamp(x, view_w_half, room_width - view_w_half); //Prevents camera from moving beyond edge of the room horizontally

y = clamp(y, view_h_half, room_height - view_h_half); //Prevents camera from moving beyond edge of the room vertically

//---------UPDATE CAMERA VIEW

camera_set_view_pos(cam, x - view_w_half, y - view_h_half); //Places player in center of viewfinder, instead of top left
