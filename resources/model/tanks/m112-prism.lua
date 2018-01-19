local tank={}
tank.components={}
tank.components.wheel={}
tank.components.track={}
tank.tank_name = "m112-prism"
tank.components.track[1] = {
id = 197552,
name = "TankTrack",
scene_type = "tank_track",
position = irr.core.vector3df:new_local(-0.264975,0.000000,2.564735),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/prism_track.obj",
collision_mesh_path = "",
mass = 5.000000,
side = "left",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.track[1]
tank.components.track[2] = {
id = 335223,
name = "TankTrack",
scene_type = "tank_track",
position = irr.core.vector3df:new_local(-0.317995,0.000000,-2.635158),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/prism_track.obj",
collision_mesh_path = "",
mass = 5.000000,
side = "right",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.track[2]
tank.components.turret = {
id = 783099,
name = "TankTurret",
scene_type = "tank_turret",
position = irr.core.vector3df:new_local(0.000000,2.732245,0.000000),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/prism_turret.obj",
collision_mesh_path = "",
mass = 3.000000,
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.turret
tank.components.canon = {
id = 798440,
name = "TankCanon",
scene_type = "tank_canon",
position = irr.core.vector3df:new_local(-0.119146,4.101121,0.000000),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/prism_canon.obj",
collision_mesh_path = "resources/model/tanks/m112-prism/prism_canon_col.obj",
mass = 2.000000,
min_angle = -5.000000,
max_angle = 45.000000,
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.canon
tank.components.fire_point = {
name = "TankFirePoint",
id = 911647,
scene_type = "tank_fire_point",
position = irr.core.vector3df:new_local(1.235492,4.101121,0.001640),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
canon_id = 798440,
} -- tank.components.fire_point
tank.components.body = {
id = 394383,
name = "TankBody",
scene_type = "tank_body",
position = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/prism_body.obj",
collision_mesh_path = "",
mass = 4.000000,
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.body
tank.components.wheel[1] = {
name = "TankWheel_l",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(2.251280,0.667142,2.619652),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/lw.obj",
side = "left",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[1]
tank.components.wheel[2] = {
name = "TankWheel_fl",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(3.040141,1.401232,2.241379),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/fblw.obj",
side = "left",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[2]
tank.components.wheel[3] = {
name = "TankWheel_br",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(-4.453565,1.361870,2.241379),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/fblw.obj",
side = "left",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[3]
tank.components.wheel[4] = {
name = "TankWheel_l",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(0.795670,0.667142,2.619652),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/lw.obj",
side = "left",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[4]
tank.components.wheel[5] = {
name = "TankWheel_l",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(-0.648947,0.667142,2.619652),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/lw.obj",
side = "left",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[5]
tank.components.wheel[6] = {
name = "TankWheel_l",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(-2.162290,0.667142,2.619652),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/lw.obj",
side = "left",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[6]
tank.components.wheel[7] = {
name = "TankWheel_l",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(-3.625654,0.667142,2.619652),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/lw.obj",
side = "left",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[7]
tank.components.wheel[8] = {
name = "TankWheel_fr",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(3.005382,1.331214,-2.263587),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/fbrw.obj",
side = "right",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[8]
tank.components.wheel[9] = {
name = "TankWheel_br",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(-4.535667,1.331214,-2.284267),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/fbrw.obj",
side = "right",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[9]
tank.components.wheel[10] = {
name = "TankWheel_r",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(2.173762,0.649650,-2.511893),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/rw.obj",
side = "right",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[10]
tank.components.wheel[11] = {
name = "TankWheel_r",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(0.759359,0.649650,-2.511893),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/rw.obj",
side = "right",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[11]
tank.components.wheel[12] = {
name = "TankWheel_r",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(-0.684288,0.649650,-2.511893),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/rw.obj",
side = "right",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[12]
tank.components.wheel[13] = {
name = "TankWheel_r",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(-2.070749,0.649650,-2.511893),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/rw.obj",
side = "right",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[13]
tank.components.wheel[14] = {
name = "TankWheel_r",
scene_type = "tank_wheel",
position = irr.core.vector3df:new_local(-3.662301,0.649650,-2.511893),
rotation = irr.core.vector3df:new_local(0.000000,0.000000,0.000000),
scale = irr.core.vector3df:new_local(1.000000,1.000000,1.000000),
mesh_path = "resources/model/tanks/m112-prism/rw.obj",
side = "right",
autoplay = true,
startLoop = "",
animation = {
},
} -- tank.components.wheel[14]
tank.property = {tank_type = "prism",
mesh_destroyed = "resources/model/tanks/m112-prism/prism_des.obj",
turret_rotation_speed = 90,
}
return tank
