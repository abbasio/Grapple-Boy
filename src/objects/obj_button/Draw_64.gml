/// @desc DRAW BUTTON

#region//---------SET COLOR
draw_set_color(merge_color(c_ltgrey, c_white, hover)); //Sets the color for the button to merge from light grey to white, based on the 'hover' variable
#endregion

#region//---------DRAW BUTTON
draw_roundrect (x, y, x + button_width, y + button_height, 0); //Draws a round rectangle with the dimensions (button_width x button_height)
#endregion

#region//---------DRAW TEXT
draw_set_color (c_black); //Sets the text color to black
draw_set_halign (fa_center); //Aligns the text in the center, horizontally
draw_set_valign(fa_middle); //Aligns the text in the center, vertically
draw_text(x + button_width / 2, y + button_height / 2, text); //Draws the string from 'text' at the center of the button
#endregion

