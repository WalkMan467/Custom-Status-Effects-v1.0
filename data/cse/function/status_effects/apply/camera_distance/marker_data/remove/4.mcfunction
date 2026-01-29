scoreboard players reset @s cse.status_effects.camera_distance
scoreboard players reset @s cse.status_effects.camera_distance.base.value
scoreboard players reset @s cse.status_effects.camera_distance.value.max
scoreboard players reset @s cse.status_effects.camera_distance.value

function cse:status_effects/apply/camera_distance/marker_data/remove/5

$attribute @s minecraft:camera_distance modifier remove cse.status_effects.camera_distance.$(id)