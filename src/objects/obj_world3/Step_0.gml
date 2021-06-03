///@desc Make Buttons

#region//---------CREATE BUTTONS

CreateButton(button_x, 40, width, height, "Level 11", Level11); //Creates a button according to defined parameters - see Scripts>CreateButton

CreateButton (button_x, 40 + height + 40, width, height, "Level 12", Level12); 

CreateButton (button_x, 40 + (height + 40) * 2, width, height, "Level 13", Level13); 

CreateButton (button_x, 40 + (height + 40) * 3, width, height, "Level 14", Level14);

CreateButton (button_x, 40 + (height + 40) * 4, width, height, "Level 15", Level15);

CreateButton (button_x * 0.2, 40 + (height + 40) * 4, width, height, "<- Previous", WorldTwo);


#endregion