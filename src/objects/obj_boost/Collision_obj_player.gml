/// @desc Boost

with (obj_player)
if (place_meeting(x, y + 1, obj_boost))
{
	vsp = -vsp * 1.5
	hsp = -hsp * 1.5
}