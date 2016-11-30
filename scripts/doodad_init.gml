
self.tileX = ceil(get_tile_x(x, y)) - self.sizeX;
self.tileY = ceil(get_tile_y(x, y)) - self.sizeY;
depth = - self.tileX - self.tileY;

self.gid = tile_index_from_region(self.tileX, self.tileY, self.sizeX, self.sizeY);

global.objMap[self.tileX, self.tileY] = self;


