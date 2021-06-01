/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg text
///@arg script

function CreateButton(){
var _x = argument0;
var _y = argument1;
var _width = argument2;
var _height = argument3;
var _text = argument4;
var _script = argument5;

//---------CREATE BUTTON

var _button = instance_create_layer (_x, _y, "Button", obj_button);

//---------SET VALUES
with (_button)
{
	button_width = _width;
	button_height = _height;
	text = _text;
	script = _script;
}

return _button
}