/// @desc Autosave

#region//---------OVERWRITE OLD SAVE

if (file_exists(SAVEFILE)) //If a savefile already exists
	file_delete(SAVEFILE); //Delete the savefile.

#endregion

#region//---------CREATE NEW SAVE

var file; //Creates a variable for a file
file = file_text_open_write(SAVEFILE); //Opens SAVEFILE for purposes of writing into it
file_text_write_real(file, room); //Writes the index value of the current room to SAVEFILE
file_text_close(file); //Closes SAVEFILE

#endregion