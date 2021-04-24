/// @description Control Menu

//Menu appearing

menu_x += (menu_x_target - menu_x) / menu_speed

//---------MENU CONTROLS

if(menu_control) //if we have menu control
{
	if (keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up))
	{
		menu_cursor += 1;                                  //Pressing W or up arrow moves the menu selection up by 1
		if (menu_cursor >= menu_items) menu_cursor = 0;    //Resets the cursor if the number increases beyond # of selections
	}
	if (keyboard_check_pressed(ord("S"))) || (keyboard_check_pressed(vk_down))
	{
		menu_cursor -= 1;									//Pressing S or down arrow moves the menu selection down by 1
		if (menu_cursor <0) menu_cursor = menu_items - 1;  //Resets the cursor if the number decreases below 1
	}
	
	if (keyboard_check_pressed(vk_space)) || (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width + 200; //Sends the menu back off to the right off the screen
		menu_committed = menu_cursor; //Designates what menu item was selected
		menu_control = false; //Removes control over menu after an item has been selected
	}
}

if(menu_x > gui_width + 150) && (menu_committed != -1) //If the menu has gone off to the right, and an option has been selected
{
	switch(menu_committed) //Chooses outcome based on which menu selection was chosen
	{
		case 2: default: SlideTransition(transition_mode.NEXT); break; //Use the SlideTransition function, choosing the mode "NEXT"
		case 0: game_end(); break;
	}
	
}