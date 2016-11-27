
var tiledepth = global.TMX_DEPTH_OFFSET[0] - argument0 - argument1;
self.tileId = tile_layer_find(tiledepth, x, y - global.TMX_TILE_HEIGHT / 2);
var t_l = tile_get_left(self.tileId);
var t_t = tile_get_top(self.tileId);
var t_w = tile_get_width(self.tileId);
var t_h = tile_get_height(self.tileId);
var bg = tile_get_background(self.tileId);
var bg_w = background_get_width(bg);
var bg_h = background_get_height(bg);
var t_wcount = floor(bg_w/t_w)
self.gid = t_t*t_wcount/t_h + t_l/t_w;

