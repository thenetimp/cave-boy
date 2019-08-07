/// @description controlling player state

#region Setup control keys for the player

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
up_release = keyboard_check_released(vk_up);

#endregion

#region State machine

switch(state) {

#region Moving State"
	case player.moving:
		// Set sprite
		if(xspeed == 0) {
			sprite_index = s_player_idle;
		}
		else
		{
			sprite_index = s_player_walk;
		}
	
		// Check if player is on the ground
		if(!place_meeting(x, y + 1, o_solid)) {
			yspeed += gravity_acceleration;
			
			// Player is in the air
			
			sprite_index = s_player_jump;
			image_index = (yspeed > 0);
			
			if(up_release and yspeed < -6) {
				yspeed = -3;
			}
			
		}
		else
		{
			// If we are on the ground yspeed is 0;
			yspeed = 0;

			// if up is pressed start jump;
			if(up) {
			  yspeed = jump_height;
			  audio_play_sound(a_jump, 5, false);
			}
			
		}

		// Change direction of sprite
		if(xspeed != 0) {
			image_xscale = sign(xspeed);
		}
	
		// Check for moving left or right
		if(right or left) {
			xspeed += (right - left) * acceleration;
	
			// Clamp function prevents value from 
			// exceeding minimum or maxiumn set
			// In our example "xspeed can be no greater than max_speed (moving right at max_speed)
			// and no less than negative max_speed (moving left at max_speed)
			xspeed = clamp(xspeed, -max_speed, max_speed);
		
		} else {
			// Gracefully bring us to a stop.
			apply_friction(acceleration);
		}
		
		if(place_meeting(x,y+yspeed+1,o_solid) and yspeed > 0) {
			audio_play_sound(a_step, 6, false);
		}

		// Move if we should move.
		move(o_solid);
		  
		// Check for lege grab state
		var falling = y - yprevious > 0;
		var wasnt_wall = !position_meeting(x + (grab_width * image_xscale), yprevious, o_solid);
		var is_wall = position_meeting(x + (grab_width * image_xscale), y, o_solid);

		if(falling and wasnt_wall and is_wall) {

			// set our speeds to 0
			xspeed = 0;
			yspeed = 0;

			// Check the horizontal position, and Move against ledge
			while(!place_meeting(x + image_xscale, y, o_solid)) {
				x += image_xscale;
			}
			
			// Check the vertical position
			while(position_meeting(x + (grab_width * image_xscale), y - 1, o_solid))
			{
				y -= 1;
			}
			
			sprite_index = s_player_ledge_grap;
			state = player.ledge_grab
			audio_play_sound(a_step, 6, false);
			
		}

		break;
#endregion
#region Ledge Grab State"
	case player.ledge_grab:

		// Allow us to fall down.
		if(down) {
			state = player.moving;
		}

		// Make sure we can jump up
		if(up) {
			state = player.moving;
			yspeed = jump_height;
		}
	
		break;
#endregion
#region Door State"
	case player.door:
		sprite_index = s_player_exit;

		// fade out
		if(image_alpha > 0){
			image_alpha -= .05
		}
		else
		{
			room_goto_next(); 
		}
	     
		break;
#endregion
#region Hurt State"
	case player.hurt:
		break;
#endregion
#region Death State"
	case player.death:
		break;
#endregion

}


#endregion