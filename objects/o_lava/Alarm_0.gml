/// @description create lava particles.
with(instance_create_layer(x + random(sprite_width), y - (sprite_height / 2), "Lava", o_particle)) {
  image_blend = c_yellow;
}

// every 10 to 20 steps make particle
alarm[0] = random_range(10, 20);