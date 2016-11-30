var road = argument0;
var from = argument1;


if (!is_array(road.connection))
{
    var nexts;
    if (road.tileX == 0) nexts[0] = noone;
    else nexts[0] = global.objMap[road.tileX-1, road.tileY];
    if (road.tileY == 0) nexts[1] = noone;
    else nexts[1] = global.objMap[road.tileX, road.tileY-1];
    if (road.tileX == global.TMX_WIDTH-1) nexts[2] = noone;
    else nexts[2] = global.objMap[road.tileX+1, road.tileY];
    if (road.tileY == global.TMX_HEIGHT-1) nexts[3] = noone; 
    else nexts[3] = global.objMap[road.tileX, road.tileY+1];
    
    var i = 0;
    for(var j=0;j<array_length_1d(nexts);j++)
    {
        var next = nexts[j];
        if (next != noone && object_is_ancestor(next.object_index, Road))
        {
            road.connection[i++] = next;
        }
    }
    if (i == 0) road.connection[0] = road;
}

var cnt = array_length_1d(road.connection);
if (cnt == 0) return road;
if (cnt == 1) return road.connection[0];

for(var i=0;i<cnt;i++)
{
    if (road.connection[i] != from) continue;
    return road.connection[(irandom(cnt - 2) + i + 1) % cnt];
}
return road.connection[irandom(cnt - 1)];

