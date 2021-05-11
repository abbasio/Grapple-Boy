/// @description Progress transition

if (mode != transition_mode.OFF) //If we are not in the OFF transition mode
{
	if (mode == transition_mode.INTRO)
	{
		percent = max(0, percent - max((percent/10), 0.005));
	}
	else
	{
		percent = min(1.2, percent + max(((1.2 - percent) / 10), 0.005));
	}
}

if (percent == 1.2) || (percent == 0)
{
	switch (mode) //Switches the mode
	{
		case transition_mode.INTRO: //Transition at the start of the game
		{
			mode = transition_mode.OFF;
			break;
		}
		case transition_mode.NEXT: //Transition for moving to the next room
		{
			mode = transition_mode.INTRO;
			room_goto_next();
			break;
		}
		case transition_mode.GOTO: //Transition for moving to a specific room
		{
			mode = transition_mode.INTRO;
			room_goto(target);
			break;
		}
		case transition_mode.DEATH: //Transition for dying 
		{
			mode = transition_mode.INTRO;
			room_restart();
			break;
		}
		case transition_mode.RESTART: //Transition for restarting the game 
		{
			game_restart();
			break;
		}
	}
}