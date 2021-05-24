/// @description GUI/Vars/Menu setup

#region//---------SAVE

#macro SAVEFILE "save.sav" //generates a file containing the information in quotes

#endregion

#region//---------GUI

gui_width = display_get_gui_width(); //Establishes width of GUI
gui_height = display_get_gui_height(); //Establishes height of GUI

#endregion

#region//---------MENU


menu_x = gui_width / 2; //Establishes the x position of the menu
menu_y = gui_height * 2; //Establishes the y position of the menu
menu_y_target = gui_height * 0.66; //Establishes the target location for the menu
menu_speed = 25; //Lower = faster
menu_font = f_menu; //Sets font for the menu
menu_item_height = font_get_size(f_menu); //Sets size for the menu
menu_committed = -1;
menu_control = true; //Dictates whether we have control of the menu or not

#endregion

#region//---------ARRAY AND SELECTION

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu); //Number of menu options = number of entries into the menu array
menu_cursor = 2; //Establishes what is currently selected in the menu

#endregion


