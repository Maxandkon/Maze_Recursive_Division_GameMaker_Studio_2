/// @description Insert description here
// You can write your code in this editor

/// @main path finding stuff
gr_flw = mp_grid_create(0, 0, room_width/32, room_height/32, 32, 32);
flw_pth = path_add();

mp_grid_add_instances(gr_flw, Owall, true);
path_set_kind(gr_flw, 0);

