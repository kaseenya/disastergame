
var tx_from = argument0;
var ty_from = argument1;
var tx_to = argument0 + argument2;
var ty_to = argument1 + argument3;

var totalgid = -1;
for(var ty = ty_from; ty <ty_to; ty++)
{
    for(var tx = tx_from; tx < tx_to; tx++)
    {
        var gid = tile_index_from_tile_coordinate(tx, ty);
        if (totalgid == -1)
        {
            totalgid = gid;
        }
        else if (totalgid != gid)
        {
            show_error("("+string(tx)+","+string(ty)+") 건물 지반이 통일되어있지 않아요!", false);
        }
    }
}
return totalgid;

