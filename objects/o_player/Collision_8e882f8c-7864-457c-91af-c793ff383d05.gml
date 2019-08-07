/// @description Move to next level.

if(up && other.visible == true) {
	y = yprevious;
	state = player.door;
	audio_stop_sound(a_jump);
	audio_play_sound(a_exit, 4, false);
} 
	
if(room == r_boss)
{
  game_restart();	
}