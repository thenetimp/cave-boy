/// @description move(collision_object)
/// @param collision_object

var collision_object = argument0;

#region Horizontal Collisions
show_debug_message("moving: " + string(xspeed))


// Check if we are meeting the collision object
if(place_meeting(x + xspeed, y, collision_object)) {
	
	
	// Check if we can move one pixel closer to the collision object
	while(!place_meeting(x + sign(xspeed), y, collision_object))
	{
		show_debug_message("slow moving: " + string(xspeed))
		// If we can move one pixel closer
		x += sign(xspeed);
	}

	// Stop or X movement.
	xspeed = 0;
}

// Move left and right
x += xspeed;

#endregion

#region Vertical Collisions
if(place_meeting(x , y + yspeed, collision_object)) {
	
	
	// Check if we can move one pixel closer to the collision object
	while(!place_meeting(x , y + sign(yspeed), collision_object))
	{
		// If we can move one pixel closer
		y += sign(yspeed);
		
	}

	// Stop or Y movement.
	yspeed = 0;
}


// Move up and down
y += yspeed;

#endregion





