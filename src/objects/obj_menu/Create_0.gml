/// @description GUI/Vars/Menu setup
#macro SAVEFILE "save.sav" //generates a file containing the information in quotes


gui_width = display_get_gui_width(); //Establishes width of GUI
gui_height = display_get_gui_height(); //Establishes height of GUI
gui_margin = 32; //Establishes a margin for the GUI

menu_x = gui_width + 200; //Establishes the x position of the menu
menu_y = gui_height - gui_margin; //Establishes the y position of the menu
menu_x_target = gui_width - gui_margin; //Establishes the target location for the menu
menu_speed = 25; //Lower = faster
menu_font = f_menu; //Sets font for the menu
menu_item_height = font_get_size(f_menu); //Sets size for the menu
menu_committed = -1;
menu_control = true; //Dictates whether we have control of the menu or not

//---------ARRAY FOR MENU

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu); //Number of menu options = number of entries into the menu array
menu_cursor = 2; //Establishes what is currently selected in the menu
