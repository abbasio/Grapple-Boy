/// @description Set up Camera


cam = view_camera[0]; //Selects viewport 0

follow = obj_player;  //Set the camera to follow the player

view_w_half = camera_get_view_width(cam) * 0.5;  //Establishes half of the viewfinder, widthwise
view_h_half = camera_get_view_height(cam) * 0.5; //Establishes half of the viewfinder, heightwise

x_toward = xstart;   //Designates the x location the camera moves towards
y_toward = ystart;   //Designates the y location the camera moves towards