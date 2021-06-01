// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Level3(){
instance_destroy(obj_manager);
instance_destroy(obj_button);
SlideTransition (transition_mode.GOTO, Room3);
}