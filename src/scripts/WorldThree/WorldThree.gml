// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WorldThree(){

audio_play_sound(snd_scroll, 1, false);
instance_destroy(obj_world2);
instance_destroy(obj_button);
SlideTransition (transition_mode.GOTO, World3);

}