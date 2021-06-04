// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MainMenu(){

audio_play_sound(snd_scroll, 1, false);
instance_destroy(obj_world1);
instance_destroy(obj_button);
SlideTransition (transition_mode.GOTO, Room_Menu);

}