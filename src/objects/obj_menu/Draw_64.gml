/// @description Draw Menu

draw_set_font(f_menu); //Selects font for the menu
draw_set_halign(fa_right); //Aligns menu horizontally
draw_set_valign(fa_bottom); //Aligns menu vertically

for (var i = 0; i < menu_items; i +=1) //Variable i, starting at 0 - the initial selection for the menu. 
									  //As long as i is less than the number of menu items, it will increase by 1 every loop.
{
	var offset = 2; //This provides a 'boldened' effect for the menu - see the draw_text function below
	var txt = menu[i]; //This variable is equal to the text of the currently selected menu item
	if (menu_cursor == i) //If the current menu item is selected
	{
		txt = string_insert("> ", txt, 0); //Inserts a ">" at the start of the string for that menu item
		var col = c_white; //Sets the text color to white when a menu object is selected
	}
	else 
	{
		var col = c_grey; //Sets the text color to grey when the a menu object is not selected
	}
	var xx = menu_x; //Establishes a variable for the x position of the menu
	var yy = menu_y - (menu_item_height * (i * 1.5)); //Establishes a variable for the y position of the menu
	draw_set_color(c_black); //This section just draws the text in black multiple times at slight displacements
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy+offset,txt);
	draw_text(xx,yy-offset,txt);
	draw_set_color(col); //This draws the actual text based on the col variable, which is denoted by whether the menu item is selected or not
	draw_text(xx,yy,txt);//Draws the selected menu text at the established x and y positions
}