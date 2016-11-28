local map_info={}
map_info.setting={
map_name = "mini_manhattan",
["ambient colour"] = irr.video.SColor:new_local(255,100,100,100),
["skydome texture"] = "resources/sfx/env/skydome/cloud_skydome.jpg",
logic_data = "",
} -- settings
-- objects
map_info.objects={}
map_info.objects[1] = {
name = "ground",
id = 394383,
scene_type = "octree",
physics_type = "static",
position = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/maps/mini_manhattan/city.3ds",
textures = {
"resources/maps/mini_manhattan/bulding.png",
"resources/maps/mini_manhattan/city.png",
}, -- textures
logic_data = "",
} -- map_info.objects[1]
map_info.objects[2] = {
name = "spawn point A1",
id = 783099,
scene_type = "spawn_point",
position = irr.core.vector3df:new_local(53.472622,0.000000,-442.293335),
rotation = irr.core.vector3df:new_local(0.000000,90.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
team = 1,
logic_data = "",
} -- map_info.objects[2]
map_info.objects[3] = {
name = "spawn point A2",
id = 798440,
scene_type = "spawn_point",
position = irr.core.vector3df:new_local(85.644478,0.000000,-442.293335),
rotation = irr.core.vector3df:new_local(0.000000,90.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
team = 1,
logic_data = "",
} -- map_info.objects[3]
map_info.objects[4] = {
name = "spawn point A3",
id = 911647,
scene_type = "spawn_point",
position = irr.core.vector3df:new_local(26.052238,0.000000,-442.293335),
rotation = irr.core.vector3df:new_local(0.000000,90.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
team = 1,
logic_data = "",
} -- map_info.objects[4]
map_info.objects[5] = {
name = "sun",
id = 197552,
scene_type = "light",
position = irr.core.vector3df:new_local(52.535847,176.001434,-200.134979),
rotation = irr.core.vector3df:new_local(14.000000,-16.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
ambient_color = irr.video.SColor:new_local(0,0,0,0),
diffuse_color = irr.video.SColor:new_local(255,255,255,255),
specular_color = irr.video.SColor:new_local(255,255,255,255),
attenuation = irr.core.vector3df:new_local(0.000000,0.010000,0.000000),
falloff = 2.000000,
outerCone = 45.000000,
innerCone = 0.000000,
radius = 100.000000,
cast_shadow = true,
light_type = "directional",
logic_data = "",
} -- map_info.objects[5]
map_info.objects[6] = {
name = "cube",
id = 335223,
scene_type = "cube",
physics_type = "static",
position = irr.core.vector3df:new_local(110.702744,1.500000,-296.791931),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
size = 3.000000,
textures = {
"resources/maps/mini_manhattan/default_cobe_texture.png",
}, -- textures
logic_data = "",
} -- map_info.objects[6]
map_info.objects[7] = {
name = "cube",
id = 768229,
scene_type = "cube",
physics_type = "static",
position = irr.core.vector3df:new_local(113.974678,1.500000,-296.791931),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
size = 3.000000,
textures = {
"resources/maps/mini_manhattan/default_cobe_texture.png",
}, -- textures
logic_data = "",
} -- map_info.objects[7]
map_info.objects[8] = {
name = "cube",
id = 277775,
scene_type = "cube",
physics_type = "static",
position = irr.core.vector3df:new_local(117.226837,1.500000,-296.791931),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
size = 3.000000,
textures = {
"resources/maps/mini_manhattan/default_cobe_texture.png",
}, -- textures
logic_data = "",
} -- map_info.objects[8]
map_info.objects[9] = {
name = "cube",
id = 553970,
scene_type = "cube",
physics_type = "static",
position = irr.core.vector3df:new_local(120.317139,1.500000,-296.791931),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
size = 3.000000,
textures = {
"resources/maps/mini_manhattan/default_cobe_texture.png",
}, -- textures
logic_data = "",
} -- map_info.objects[9]
map_info.objects[10] = {
name = "cube",
id = 477397,
scene_type = "cube",
physics_type = "static",
position = irr.core.vector3df:new_local(120.317139,4.560368,-296.791931),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
size = 3.000000,
textures = {
"resources/maps/mini_manhattan/default_cobe_texture.png",
}, -- textures
logic_data = "",
} -- map_info.objects[10]
map_info.objects[11] = {
name = "cube",
id = 628871,
scene_type = "cube",
physics_type = "static",
position = irr.core.vector3df:new_local(117.226837,4.560368,-296.791931),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
size = 3.000000,
textures = {
"resources/maps/mini_manhattan/default_cobe_texture.png",
}, -- textures
logic_data = "",
} -- map_info.objects[11]
map_info.objects[12] = {
name = "cube",
id = 364785,
scene_type = "cube",
physics_type = "static",
position = irr.core.vector3df:new_local(113.974678,4.560368,-296.791931),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
size = 3.000000,
textures = {
"resources/maps/mini_manhattan/default_cobe_texture.png",
}, -- textures
logic_data = "",
} -- map_info.objects[12]
map_info.objects[13] = {
name = "cube",
id = 513401,
scene_type = "cube",
physics_type = "static",
position = irr.core.vector3df:new_local(110.702744,4.560368,-296.791931),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
size = 3.000000,
textures = {
"resources/maps/mini_manhattan/default_cobe_texture.png",
}, -- textures
logic_data = "",
} -- map_info.objects[13]
return map_info