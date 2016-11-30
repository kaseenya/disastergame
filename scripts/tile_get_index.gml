
var tileid = argument0;
if (tileid == -1) return -1;
var t_l = tile_get_left(tileid);
var t_t = tile_get_top(tileid);
var t_w = tile_get_width(tileid);
var t_h = tile_get_height(tileid);
var bg = tile_get_background(tileid);
var bg_w = background_get_width(bg);
var bg_h = background_get_height(bg);
var t_wcount = floor(bg_w/t_w)
return t_t*t_wcount/t_h + t_l/t_w;

