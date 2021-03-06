/// @description Set up Camera


cam = view_camera[0]; //Selects viewport 0

follow = obj_player;  //Set the camera to follow the player

view_w_half = camera_get_view_width(cam) * 0.5;  //Establishes half of the viewfinder, widthwise
view_h_half = camera_get_view_height(cam) * 0.5; //Establishes half of the viewfinder, heightwise

x_toward = xstart;   //Designates the x location the camera moves towards
y_toward = ystart;   //Designates the y location the camera moves toward

cloud_layer = layer_get_id("Background_Clouds"); //Establishes layer for the background clouds
mountain_layer = layer_get_id("Background_Mountains"); //Establishes layer for the background mountains


cave_front = layer_get_id("cave_front");
cave_mid = layer_get_id("cave_mid");
cave_back = layer_get_id("cave_back");
cave_beams = layer_get_id("cave_beams");

ice_front = layer_get_id("ice_clouds_front");
ice_mid = layer_get_id("ice_clouds_mid");
ice_fog = layer_get_id("ice_fog");
ice_mountain = layer_get_id("ice_mountain");
ice_back = layer_get_id("ice_clouds_back");
//---------SCREENSHAKE

shake_length = 0; //Duration of screenshake, in frames
shake_mag = 0; //Strength of screenshake, in pixels
shake_remain = 0; //Strength of screenshake over time
buff = 32; //Adds buffer to camera position