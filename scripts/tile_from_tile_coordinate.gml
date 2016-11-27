
var tx = argument0;
var ty = argument1;

var px = get_pixel_x(tx, ty);
var py = get_pixel_y(tx, ty);
var tiledepth = global.TMX_DEPTH_OFFSET[0] - tx - ty;
return tile_layer_find(tiledepth, px, py + global.TMX_TILE_HEIGHT / 2);


