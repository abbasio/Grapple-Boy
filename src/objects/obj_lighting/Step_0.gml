/// @desc

surface_set_target(global.light);

draw_set_color(c_ltgrey);
draw_rectangle(0,0, room_width, room_height, false);
surface_reset_target();