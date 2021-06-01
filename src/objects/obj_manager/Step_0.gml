///@desc Make Buttons

#region//---------CREATE BUTTONS
CreateButton(button_x, 40, width, height, "Level 1", Level1); //Creates a button according to defined parameters - see Scripts>CreateButton

CreateButton (button_x, 40 + height + 40, width, height, "Level 2", Level2); //Creates a button according to defined parameters - see Scripts>CreateButton

CreateButton (button_x, 40 + (height + 40) * 2, width, height, "Level 3", Level3); //Creates a button according to defined parameters - see Scripts>CreateButton
#endregion