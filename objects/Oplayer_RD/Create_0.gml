/// @description Insert description here
// You can write your code in this editor
randomize();
//obj_arr = [[]];
//angle_check = 0;
//touch = 0;
//num1_rund = 0;
//count = 0;
//angle = [];
//array_pos = [[]];
//arrayy = [];
//key = 1;
//p = [];
//r_h = (room_height/128);
//r_w = (room_width/128);
//r_empt = ((room_height/128) div 2) + irandom_range(-1,1);
//r_wall_plc = ((room_width/128) div 2) + irandom_range(-2,2);
//n=2;
/// @path finding
//gr_flw = mp_grid_create(0, 0, room_width/128, room_height/128, 128, 128);
//flw_pth = path_add();
//mp_grid_add_instances(gr_flw, Owall, true);
//path_set_kind(gr_flw, 0);

///
///


/// @for step
spd = 10;


/// @basic box walls
for (var i = 0; i < room_width/128; i++){
		for (var j = 0; j < room_height/128; j++){
			if (j == 0){
				//angle_check = 0;
				var a1 = instance_create_layer(x + 128*i, y + 128*j,"Instances_1",Owall);	
				with (a1){
					//image_angle += 0;
				}
			}
			else if (j == room_height/128 - 1){
				//angle_check = 180;
				var a3 = instance_create_layer(x + 128*i, y + 128*j,"Instances_1",Owall);	
				with (a3){
					image_angle += 180;
				}
			}
			if (i == 0){
				//angle_check = 90;
				var a2 = instance_create_layer(x + 128*i, y + 128*j,"Instances_1",Owall);	
				with (a2){
					image_angle += 90;
				}
			}
			else if (i == room_width/128 - 1){
				//angle_check = 270;
				var a4 = instance_create_layer(x + 128*i, y + 128*j,"Instances_1",Owall);	
				with (a4){
					image_angle += 270;
				}
			}
			//obj_arr[i][j] =  instance_create_layer(x + 128*i, y + 128*j,"Instances_2",Ocant);	
		}
		//mp_grid_add_instances(gr_flw, Owall, true);
}


/// @fractal walls
//arraies
point_dw = [[]];
point_up = [[]];
point_lf = [[]];
point_rg = [[]];

//starter arrey
point_dw[0][1] = 0;
point_up[0][1] = (room_height/128)-1;
point_lf[0][1] = 0;
point_rg[0][1] = (room_width/128)-1;

//side check
//wd_chk = 0;
//hr_chk = 0;

// fractla check
frack_key = 0;

// horisontal walls
function gen_hr(hg_up,hd_dw,stp_nxt,wg_lf,wg_rg){
	var r_empt = irandom_range(hg_up,hd_dw);
	var r_wall_plc = irandom_range(wg_lf,wg_rg-1);
	
	//if(hd_dw - hg_up > 1){
		point_lf[stp_nxt][1] = wg_lf;
		point_rg[stp_nxt][1] = r_wall_plc;
		if(r_wall_plc-wg_lf > 0){frack_key+=1;}
	
		point_lf[stp_nxt][2] = r_wall_plc + 1;
		point_rg[stp_nxt][2] = wg_rg;
		if(wg_rg-(r_wall_plc + 1) > 0){frack_key+=1;}
	//}
	if(wg_rg - wg_lf > 0){
		for (var l = hg_up; l <= hd_dw; l++){
			if(l != r_empt){
				var a1 = instance_create_layer(x + 128*r_wall_plc, y + 128*l,"Instances_1",Owall);	
				with (a1){image_angle += 270;}
			}
		}
	}
}

// vertical walls
function gen_vr(hg_up,hd_dw,stp_nxt,wg_lf,wg_rg){
	var r_empt = irandom_range(wg_lf,wg_rg);
	var r_wall_plc = irandom_range(hg_up+1,hd_dw);
	
	//if(wg_rg - wg_lf > 1){
		point_dw[stp_nxt][1] = hg_up;
		point_up[stp_nxt][1] = r_wall_plc-1;
		if(r_wall_plc-hg_up > 0){}
	
		point_dw[stp_nxt][2] = r_wall_plc;
		point_up[stp_nxt][2] = hd_dw;
		if(hd_dw-(r_wall_plc + 0) > 1){}
	//}
	if(hd_dw - hg_up > 0){
		for (var k = wg_lf; k <= wg_rg; k++){
			if(k != r_empt){
				var a1 = instance_create_layer(x + 128*k, y + 128*r_wall_plc,"Instances_1",Owall);	
				//with (a1){image_angle += 270;
			}
		}
	}
}


/// @main loop
function fractal(step,side){
	frack_key = 0;
	for(var i = 1; i < 3; i++){
		gen_vr(point_dw[step-1][side],point_up[step-1][side],step,point_lf[step][i],point_rg[step][i]);
		for(var j = 1; j < 3; j++){
			gen_hr(point_dw[step][j],point_up[step][j],step+1,point_lf[step][i],(point_rg[step][i]));
			if(frack_key > 0){fractal(step+1,j);}
		}
	}
}

// first wall
gen_hr(point_dw[0][1],point_up[0][1],1,point_lf[0][1],point_rg[0][1]);
fractal(1,1);


//while(fract != 0){
//}
//fract = 2;
//gen_vr(r_w-r_wall_plc,r_h);


/// @game stuff
instance_create_layer(x + 128*((room_width/128)-1), y + 128*((room_height/128)-1),"Instances_1",Owin);
instance_create_layer(x + 128*((room_width/128)-1), y,"Instances_2",Ofake);

