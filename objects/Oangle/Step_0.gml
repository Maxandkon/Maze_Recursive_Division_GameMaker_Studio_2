/// @description Insert description here
// You can write your code in this editor

// follow
x = Oplayer_RD.x;
y = Oplayer_RD.y;

// angle
if(instance_exists(Owin)){image_angle = point_direction(Oplayer_RD.x,Oplayer_RD.y,Owin.x,Owin.y)+20;}
else{instance_destroy();}