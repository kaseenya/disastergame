   
var printx = argument0;
var printy = argument1;
var text = argument2;

var oldcolor = draw_get_colour();
draw_set_colour(c_black);
draw_text(printx - 1, printy, text);
draw_text(printx + 1, printy, text);
draw_text(printx, printy - 1, text);
draw_text(printx, printy + 1, text);
draw_set_colour(oldcolor);

draw_text(printx, printy, text);

