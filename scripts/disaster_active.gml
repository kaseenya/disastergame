
if (position_meeting(mouse_x, mouse_y, Disaster))
{
    return 0;
}

var disaster = global.current_disaster;
if (disaster == noone) return 0;

switch(disaster.target)
{
case global.TARGET_BUILDING:
    var target = global.hover;
    if (target == noone) return 0;
    var rate = 1;
    if (disaster.object_index == Fire) rate = 0.5;
    disaster_damage(target, disaster, rate);
    break;
case global.TARGET_TILE:
    var targetX = 0;
    var targetY = 0;
    var target = global.hover;
    if (target != noone)
    {
        targetX = target.tileX;
        targetY = target.tileY;
    }
    else
    {
        targetX = floor(get_tile_x(mouse_x, mouse_y));
        targetY = floor(get_tile_y(mouse_x, mouse_y));
    }
    if (targetX < 0) return 0;
    if (targetY < 0) return 0;
    if (targetX >= global.TMX_WIDTH) return 0;
    if (targetY >= global.TMX_HEIGHT) return 0;
    if (disaster.object_index == EarthQuake)
    {
        var blist;
        var to = instance_number(Building);
        for(var i=0; i<to; i++) 
        {
            blist[i] = instance_find(Building, i);
        }
        for (var i=0; i<to; i++)
        {
            var b = blist[i];
            var tx_from = b.tileX;
            var ty_from = b.tileY;
            var tx_to = tx_from + b.sizeX;
            var ty_to = ty_from + b.sizeY;
            for(var ty = ty_from; ty < ty_to; ty++)
            {
                for(var tx = tx_from; tx < tx_to; tx++)
                {
                    var dist = abs(tx - targetX) + abs(ty - targetY);
                    var rate = 0;
                    if (dist == 0) rate = 1;
                    else if (dist < 4) rate = 0.4;
                    else if (dist < 7) rate = 0.15;
                    else if (dist < 11) rate = 0.05;
                    else if (dist < 31) rate = random(0.01);
                    var px = get_pixel_x(tx, ty);
                    var py = get_pixel_y(tx, ty) + global.TMX_TILE_HEIGHT/2;
                    disaster_damage(b, disaster, rate);
                }
            }
        }
    }
    else
    {
        var tx_from = 0;
        var ty_from = 0;
        var tx_to = disaster.scopeX;
        var ty_to = disaster.scopeY;
        if (tx_to == -1)
        {
            tx_to = global.TMX_WIDTH;
        }
        else
        {
            tx_from = ceil(targetX - disaster.scopeX / 2);
            tx_to += tx_from;
            if (tx_from < 0) tx_from = 0;
            if (tx_to > global.TMX_WIDTH) tx_to = global.TMX_WIDTH;
        }
        if (ty_to == -1)
        {
            ty_to = global.TMX_HEIGHT;
        }
        else
        {
            ty_from = ceil(targetY - disaster.scopeY / 2);
            ty_to += ty_from;
            if (ty_from < 0) ty_from = 0;
            if (ty_to > global.TMX_HEIGHT) ty_to = global.TMX_HEIGHT;
        }
        
        for(var ty = ty_from; ty < ty_to; ty++)
        {
            for(var tx = tx_from; tx < tx_to; tx++)
            {
                var b = global.objMap[tx, ty];
                if (b == -1) continue;
                disaster_damage(b, disaster, 1);
            }
        }
    }
    break;
case global.TARGET_STAGE:
    break;
}

return 1;



