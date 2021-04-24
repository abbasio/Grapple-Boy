/// @description Draw Menu

draw_set_font(f_menu);
draw_set_halign(fa_right); //Aligns menu horizontally
draw_set_valign(fa_bottom); //Aligns menu vertically

for (var i = 0; i < menu_items; i +=1) //Variable i, starting at 0. 
									  //As long as i is less than the number of menu items, it will increase by +1 every loop.
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i) //If the current menu item is selected
	{
		txt = string_insert("> ", txt, 0); //Inserts a ">" at the start of the string for that menu item
		var col = c_white;
	}
	else
	{
		var col = c_grey;
	}
	var xx = menu_x;
	var yy = menu_y - (menu_item_height * (i * 1.5));
	draw_set_color(c_black); //This section just draws the text in black multiple times at slight displacements
	draw_text(xx-offset,yy,txt); //This gives a boldened look to the selected menu item
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy+offset,txt);
	draw_text(xx,yy-offset,txt);
	draw_set_color(col); //This draws the actual text based on the col variable, which is denoted by whether the menu item is selected or not
	draw_text(xx,yy,txt);
}