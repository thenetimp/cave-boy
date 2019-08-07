/// @description colliding with enemy

var above_enemy = y < (other.y + yspeed);
var falling = yspeed > 0;

if(above_enemy and (falling or state == player.ledge_grab)) {
	if(!place_meeting(x, yprevious, o_solid)) {
		y = yprevious;
		
	}
	// Get as close to enemy as possible.
	while(!place_meeting(x, y+1, other)) {
		y++;
	}
	
	with(other) {
		instance_destroy();
	}
	
	// Bounce
	yspeed = -(16/3);
	audio_play_sound(a_step, 8, false);
}
else
{
	take_damage();
}