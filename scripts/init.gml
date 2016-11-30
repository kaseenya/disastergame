// karikera: 게임을 처음 시작할 떄, 할 작업들이에요!
//           방 스크립트보다 먼저 불려요!

global.global_object = self;

randomize();
draw_set_font(font_gothic);

global.DB_WIDTH = 120;
global.DB_HEIGHT = 300;
global.HUMAN_SECOND_PER_TILE = 30;

global.db_surface = surface_create(global.DB_WIDTH, global.DB_HEIGHT);

global.particle_smoke = part_type_create();
part_type_sprite(global.particle_smoke, sprite_smokesample, 0, 0, 0);
part_type_size(global.particle_smoke,1,1.1,-0.02,0.1);
part_type_scale(global.particle_smoke,1,1);
part_type_color1(global.particle_smoke,c_white);
part_type_alpha1(global.particle_smoke,1);
part_type_speed(global.particle_smoke,0,1,0,0);
part_type_direction(global.particle_smoke,0,359,1,0);
part_type_orientation(global.particle_smoke,0,0,0,0,1);
part_type_blend(global.particle_smoke, false);
part_type_life(global.particle_smoke,30,50);

global.TARGET_BUILDING = 0;
global.TARGET_TILE = 1;
global.TARGET_STAGE = 2;

global.current_disaster = noone;
global.hover = noone;
global.hover_list = ds_list_create();

global.CAMERA_SPEED = 20;
global.CAMERA_Y_MIN = -global.DB_HEIGHT;

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

var StageList;
StageList[0] = StageX;
StageList[1] = Stage0;

for(var i=0;i<array_length_1d(StageList);i++)
{
    var roombtn = instance_create(0, 100+i * 30, StageButton);
    roombtn.room_index = StageList[i];
    roombtn.name = room_get_name(StageList[i]);
}


