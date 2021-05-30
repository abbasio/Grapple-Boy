/// @desc Pause Screen

if(global.pause) 
{
	draw_set_color(c_black);
	draw_set_alpha(0.3);
	draw_rectangle(0, 0, screen_width, screen_height, false);
	DrawSetText(c_white, f_menu, fa_center, fa_center);
	draw_set_alpha(1);
	draw_text(screen_width / 2, screen_height / 2, "Game Paused\nPress ESC to continue\nPress R to restart level\nPress Q to quit to menu");
	
}
