
ds_list_add(global.hover_list, self);
if (global.hover == -1 || depth < global.hover.depth)
{
    global.hover = self;
}

