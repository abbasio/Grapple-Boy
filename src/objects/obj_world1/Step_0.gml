///@desc Make Buttons

#region//---------CREATE BUTTONS

CreateButton(button_x, 40, width, height, "Level 1", Level1); //Creates a button according to defined parameters - see Scripts>CreateButton

CreateButton (button_x, 40 + height + 40, width, height, "Level 2", Level2); 

CreateButton (button_x, 40 + (height + 40) * 2, width, height, "Level 3", Level3); 

CreateButton (button_x, 40 + (height + 40) * 3, width, height, "Level 4", Level4);

CreateButton (button_x, 40 + (height + 40) * 4, width, height, "Level 5", Level5);

CreateButton (button_x * 1.8, 40 + (height + 40) * 4, width, height, "Next ->", WorldTwo);

#endregion