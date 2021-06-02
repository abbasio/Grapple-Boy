/// @desc Draw light

gpu_set_blendmode(bm_subtract);
draw_surface(global.light, room_width, room_height);
gpu_set_blendmode(bm_normal);