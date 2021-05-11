/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude sets the strength of the shake in pixels
/// @arg Frames sets the length of the shake in frames
function ScreenShake(_magnitude, _frames){

with (obj_camera)
{
	if (_magnitude > shake_remain) 
	{
		shake_mag = _magnitude;
		shake_remain = _magnitude;
		shake_length = _frames;
	}
}



}