/// @description Insert description here
// You can write your code in this editor

// @main path finding stuff
mp_grid_add_instances(gr_flw, Owall, true);
path_start(flw_pth, 8, path_action_stop, false);

// follow stuff
if(instance_exists(Ofake)){mp_grid_path(gr_flw, flw_pth, x, y, Ofake.x, Ofake.y, false);}
else if(instance_exists(Owin)){mp_grid_path(gr_flw, flw_pth, x, y, Owin.x, Owin.y, false);}