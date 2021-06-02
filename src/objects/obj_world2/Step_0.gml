///@desc Make Buttons

#region//---------CREATE BUTTONS

CreateButton(button_x, 40, width, height, "Level 6", Level6); //Creates a button according to defined parameters - see Scripts>CreateButton

CreateButton (button_x, 40 + height + 40, width, height, "Level 7", Level7); 

CreateButton (button_x, 40 + (height + 40) * 2, width, height, "Level 8", Level8); 

CreateButton (button_x, 40 + (height + 40) * 3, width, height, "Level 9", Level9);

CreateButton (button_x, 40 + (height + 40) * 4, width, height, "Level 10", Level10);

CreateButton (button_x * 1.8, 40 + (height + 40) * 4, width, height, "Next ->", WorldThree);

CreateButton (button_x * 0.2, 40 + (height + 40) * 4, width, height, "<- Previous", WorldOne);

#endregion