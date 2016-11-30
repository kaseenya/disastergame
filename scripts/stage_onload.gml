
global.objMap = 0;
for(var j=0;j<global.TMX_HEIGHT;j++)
{
    for(var i=0;i<global.TMX_WIDTH;i++)
    {
        global.objMap[i, j] = noone;
    }
}

var count = instance_number(Doodad);
for(var i=0;i<count;i++)
{
    with(instance_find(Doodad, i)) doodad_init();
}


