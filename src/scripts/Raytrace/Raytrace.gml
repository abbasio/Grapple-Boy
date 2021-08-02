///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg obj
///@arg res
function RayTrace(){
	var x1 = argument0; // start x pos
	var y1 = argument1; // start y pos
	var x2 = argument2; // end y pos
	var y2 = argument3; // end y pos
	var _col = argument4; // what block to check for
	var _res = argument5; // how many pixels to check at a time. 1 = most accurate, slowest

	var _coords; // array to store final coords
	var _dir = point_direction(x1, y1, x2, y2);

	while (true) {
	    // check if at the end point of colliding with an object
	    if (collision_point(x1, y1, _col, false, true)) {
	        _coords[0] = x1;
	        _coords[1] = y1;
	        return _coords; 
	    }
		
		if(point_distance(x1, y1, x2, y2) <= 1) {
			return 0;
		}
    
	    // else, increment the line one more time
	    x1 += lengthdir_x(_res, _dir);
	    y1 += lengthdir_y(_res, _dir);
	}
}