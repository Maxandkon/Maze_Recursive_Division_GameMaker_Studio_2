/// @description Insert description here
// You can write your code in this editor
// staff
randomize();
//mp_grid_add_instances(gr_flw, Owall, true);


/// @restart
if(keyboard_check_pressed(ord("R"))){game_restart()}


/// @controlls
pr_lf = keyboard_check(vk_left) or keyboard_check(ord("A"));
pr_rg = keyboard_check(vk_right) or keyboard_check(ord("D"));
pr_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
pr_dw = keyboard_check(vk_down) or keyboard_check(ord("S"));

// press check
spd_y = pr_dw - pr_up;
spd_x = pr_rg - pr_lf;

if (!place_meeting(x + (spd * spd_x), y, Owall)){x += spd * spd_x;}
if (!place_meeting(x, y + (spd * spd_y), Owall)){y += spd * spd_y;}
