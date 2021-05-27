/// @desc Draw Text

#region//---------DRAW BOX

var halfw = w * 0.5 //Establishes half of the width

draw_set_color(c_black); //Sets text box color
draw_roundrect_ext(x - halfw - border, y - h - (border * 2), x + halfw + border, y, 15, 15, false);

#endregion

#region//---------DRAW TEXT

DrawSetText(c_white, f_sign, fa_center, fa_top); //See script 'DrawSetText'
draw_text(x, y - h - border, text_current);

#endregion