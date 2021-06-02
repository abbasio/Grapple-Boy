// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Level2(){
audio_play_sound(snd_select, 2, false);
instance_destroy(obj_world1);
instance_destroy(obj_button);
SlideTransition (transition_mode.GOTO, Room2);
}