///@desc Make Buttons

#region//---------CREATE BUTTONS

CreateButton(button_x, 40, width, height, "Level 11", Level1); //Creates a button according to defined parameters - see Scripts>CreateButton

CreateButton (button_x, 40 + height + 40, width, height, "Level 12", Level2); 

CreateButton (button_x, 40 + (height + 40) * 2, width, height, "Level 13", Level3); 

CreateButton (button_x, 40 + (height + 40) * 3, width, height, "Level 14", Level4);

CreateButton (button_x, 40 + (height + 40) * 4, width, height, "Level 15", Level5);

CreateButton (button_x * 0.2, 40 + (height + 40) * 4, width, height, "<- Previous", WorldTwo);


#endregion