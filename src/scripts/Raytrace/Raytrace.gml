// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Raytrace(){
	var x0 = argument0; // start x pos
	var y0 = argument1; // start y pos
	var x1 = argument2; // end y pos
	var y1 = argument3; // end y pos
	var col = argument4; // what block to check for
	var res = argument5; // how many pixels to check at a time. 1 = most accurate, slowest

	var coords; // array to store final coords
	coords[0] = 0;
	var dir = point_direction(x0, y0, x1, y1);

	while (true) {
	    // check if at the end point of colliding with an object
	    if (collision_point(x0, y0, col, false, true)) {
	        coords[0] = x0;
	        coords[1] = y0;
	        return coords; 
	    }
		
		if(point_distance(x0, y0, x1, y1) <= 1) {
			return 0;
		}
    
	    // else, increment the line one more time
	    x0 += lengthdir_x(res, dir);
	    y0 += lengthdir_y(res, dir);
	}
}