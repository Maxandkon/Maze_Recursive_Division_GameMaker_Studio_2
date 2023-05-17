/// @description Insert description here
// You can write your code in this editor


xPl = Oplayer_RD.x;
yPl = Oplayer_RD.y;

x += (xPl - x) / 25;
y += (yPl - y) / 25;

x = clamp(x,w_half-12,room_width-w_half+12);
y = clamp(y,h_half-12,room_height-h_half+12);

camera_set_view_pos(view_camera[0],x-w_half,y-h_half);
