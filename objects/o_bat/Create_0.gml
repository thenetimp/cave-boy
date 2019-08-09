/// @description Initialize bat.

xspeed = 0;
yspeed = 0;
max_speed=1.5;
sight = 180;

enum bat {
	idle,
	chase,
};

state = bat.idle
