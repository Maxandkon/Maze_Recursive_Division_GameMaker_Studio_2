/// @description Insert description here
// You can write your code in this editor


// basic text
draw_set_colour(c_blue);
draw_set_font(Font1);
draw_text(x-250, y, text);

// restart text
if(!instance_exists(Owin)){
	draw_set_colour(c_yellow);
	draw_set_font(Font2);
	draw_text(x-300, y+100, "Press R to restart");	
}
