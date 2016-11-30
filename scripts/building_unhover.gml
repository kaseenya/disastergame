
var idx = ds_list_find_index(global.hover_list, self);
if (idx != -1)
{
    ds_list_delete(global.hover_list, idx);
    
    if (global.hover == self)
    {
        var size = ds_list_size(global.hover_list);
        var minDepth = noone;
        for(var i=0;i<size;i++)
        {
            var hovered = ds_list_find_value(global.hover_list, i);
            if (minDepth == noone || hovered.depth < minDepth.depth)
            {
                minDepth = hovered;
            }
        }
        global.hover = minDepth;
    }
}

