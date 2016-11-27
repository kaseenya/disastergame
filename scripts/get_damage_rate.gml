
var disaster = argument0;
var ground = argument1;
var material = argument2;

var materials = global.MATERIAL_RATE;
var grounds = global.GROUND_RATE;

switch(disaster.object_index)
{
case Fire: disaster = 0; break;
case EarthQuake: disaster = 1; break;
default: 
    show_debug_message("정해져있지 않은 재난이에요! Disaster Object:"+object_get_name(disaster.object_index));
    return 1;
}

var rate = 1;
if (ground >= ds_list_size(grounds))
{
    show_debug_message("지반 ID가 너무 커요! Ground ID:"+string(ground));
}
else
{
    var arr = ds_list_find_value(grounds, disaster);
    if (disaster >= ds_list_size(arr))
    {
        show_debug_message("재난 ID가 너무 커요! Disaster ID:"+string(disaster));
    }
    rate = ds_list_find_value(arr, disaster);
}

if (material >= ds_list_size(materials))
{
    show_debug_message("자재 ID가 너무 커요! Material ID:"+string(material));
}
else
{
    var arr = ds_list_find_value(materials, disaster);
    if (disaster >= ds_list_size(arr))
    {
        show_debug_message("재난 ID가 너무 커요! Disaster ID:"+string(disaster));
    }
    rate *= ds_list_find_value(arr, disaster);
}

return rate;

