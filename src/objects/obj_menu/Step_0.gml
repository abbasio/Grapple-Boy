/// @description Control Menu

#region//---------MENU APPEARING

menu_y += ((menu_y_target - menu_y) / menu_speed); //Dictates speed at which menu's initial y position approaches the desired y position

if (menu_y = menu_y_target)
{
	menu_control = true;
}

#endregion

#region//---------MENU CONTROLS

if (menu_control) //If we have menu control
{
	if (keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up))
	{
		audio_play_sound(snd_scroll,1,false);
		menu_cursor += 1;                                  //Pressing W or up arrow moves the menu selection up by 1
		if (menu_cursor >= menu_items) menu_cursor = 0;    //Resets the cursor if the number increases beyond # of selections
	}
	if (keyboard_check_pressed(ord("S"))) || (keyboard_check_pressed(vk_down))
	{
		audio_play_sound(snd_scroll,1,false);
		menu_cursor -= 1;									//Pressing S or down arrow moves the menu selection down by 1
		if (menu_cursor <0) menu_cursor = menu_items - 1;  //Resets the cursor if the number decreases below 1
	}
	
	if (keyboard_check_pressed(vk_space)) || (keyboard_check_pressed(vk_enter))
	{
		audio_play_sound(snd_select,2,false);
		ScreenShake(4,30);
		menu_y_target = gui_height * 2; //Sends the menu back down off screen
		menu_committed = menu_cursor; //Designates what menu item was selected
		menu_control = false; //Removes control over menu after an item has been selected
	}
	
}


#endregion

#region//---------MENU SELECTION

if (menu_committed !=-1) && (menu_y > gui_height * 1.6) //If the an item has been selected and the menu has gone down 
	{
		switch(menu_committed) //Chooses outcome based on which menu selection was chosen
		{
			case 2:									//If 'New Game' is selected
			SlideTransition(transition_mode.NEXT);	//Start the first room
			break; 
			case 1:								//If 'Continue' is selected
				{
					if(!file_exists(SAVEFILE)) //Checks to see if SAVEFILE exists or not
					{
						SlideTransition(transition_mode.NEXT); //If SAVEFILE doesn't exist, start the first room
					}
					else //If SAVEFILE does exist
					{
						var file = file_text_open_read(SAVEFILE); //Opens SAVEFILE for the purpose of reading it
						var target = file_text_read_real(file); //Reads the real number written in SAVEFILE
						file_text_close(file); //Closes SAVEFILE
						SlideTransition(transition_mode.GOTO, target); //Moves to the target room written in SAVEFILE
					}
				}
			break;
			case 0:		//If 'Exit' is selected
			game_end(); //End the game
			break;
		}

	
	}
#endregion