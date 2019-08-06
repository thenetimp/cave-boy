/// @description move(collision_object)
/// @param collision_object

var collision_object = argument0;

#region Horizontal Collisions

// Check if we are meeting the collision object
if(place_meeting(x + xspeed, y, collision_object)) {
	
	
	// Check if we can move one pixel closer to the collision object
	while(!place_meeting(x + sign(xspeed), y, collision_object))
	{
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


// Move up and down
y += yspeed;

#endregion





