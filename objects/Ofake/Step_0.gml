/// @description Insert description here
// You can write your code in this editor

/// @fake way to jbun
switch (jump){
	case 1:
		if(place_meeting(x,y,Ojbun)){
			x = 64;
			y = 64 + 128 * (room_height/128 - 1);
			jump--;
		}
	break;
	case 0:
		if(place_meeting(x,y,Ojbun)){instance_destroy();}
	break;
}
