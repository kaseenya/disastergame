// karikera: 게임을 처음 시작할 떄, 할 작업들이에요!
//           방 스크립트보다 먼저 불려요!

draw_set_font(font_gothic);

global.TARGET_BUILDING = 0;
global.TARGET_TILE = 1;
global.TARGET_STAGE = 2;

global.current_disaster = -1;
global.hover = -1;
global.hover_list = ds_list_create();

global.CAMERA_SPEED = 20;
global.CAMERA_Y_MIN = -150;

global.MATERIAL_DIRT = 0;
global.MATERIAL_WOOD = 1;
global.MATERIAL_CONCRETE = 2;

// 재난: 화재,지진,싱크홀,비,태풍,강풍,폭풍  

// 가로: 재난
// 세로: 흙, 나무, 콘크리트
global.MATERIAL_RATE = json_decode_default("[
[1.3    ,1.4    ,1      ,1.1    ,1.4    ,1.2    ,1.5],
[1.5    ,1.3    ,1      ,1.35   ,1.55   ,1.2    ,1.4],
[1      ,1      ,1      ,1      ,1      ,1      ,1]
]");

// 가로: 재난
// 세로: 암석, 흙, 진흙, 모래, 물
global.GROUND_RATE = json_decode_default("[
[1      ,1      ,0      ,1      ,1      ,1      ,1],
[1      ,1.5    ,1      ,1.25   ,1      ,1      ,1],
[1      ,2      ,1      ,1.5    ,1      ,1      ,1],
[1      ,2.5    ,1      ,1.7    ,1.5    ,1.2    ,1.5],
[0.5    ,0      ,0      ,0      ,2      ,1      ,1]
]");

