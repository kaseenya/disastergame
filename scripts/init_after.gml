// karikera: 게임을 처음 시작할 떄, 할 작업들이에요!
//           방 스크립트 후에 불려요!

global.buildingMap = 0;
for(var j=0;j<global.TMX_HEIGHT;j++)
{
    for(var i=0;i<global.TMX_WIDTH;i++)
    {
        global.buildingMap[i, j] = -1;
    }
}

