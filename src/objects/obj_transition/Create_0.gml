/// @description Size, variables, and mode setup

w = display_get_gui_width(); //Gets width of GUI

h = display_get_gui_height(); //Gets height of GUI

w_half = w * 0.5; //Half of GUI width

h_half = h * 0.5; //Half of GUI height

enum transition_mode //Establishes multiple transition modes
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	DEATH,
	INTRO
}

mode = transition_mode.INTRO; //Establishes a variable for the initial transition mode

percent = 1; 

target = room; //Sets a target room to transition to


