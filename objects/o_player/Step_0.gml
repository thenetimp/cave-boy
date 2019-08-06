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
	
		break;
#endregion
#region Ledge Grab State"
	case player.ledge_grabbing:
		break;
#endregion
#region Door State"
	case player.door:
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