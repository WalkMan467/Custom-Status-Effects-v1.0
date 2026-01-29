# @s = Status Effects Marker

$data modify entity @s data.cse.camera_distance.add.value set value $(value)f
$data modify entity @s data.cse.camera_distance.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.camera_distance $(duration)

function cse:status_effects/apply/camera_distance/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.camera_distance.math run \
data get entity @s data.cse.camera_distance.add.value 1000

execute \
    store result score #base cse.status_effects.camera_distance.math run \
data get entity @s data.cse.camera_distance.base_value 1000

execute \
    store result score #max cse.status_effects.camera_distance.math run \
data get entity @s data.cse.camera_distance.max_value 1000

scoreboard players set $abs cse.status_effects.camera_distance.math -1
scoreboard players operation #base.abs cse.status_effects.camera_distance.math = #base cse.status_effects.camera_distance.math
scoreboard players operation #max.abs cse.status_effects.camera_distance.math = #max cse.status_effects.camera_distance.math

execute \
    if score #base cse.status_effects.camera_distance.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.camera_distance.math *= $abs cse.status_effects.camera_distance.math

execute \
    if score #max cse.status_effects.camera_distance.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.camera_distance.math *= $abs cse.status_effects.camera_distance.math

execute \
    if score #base.abs cse.status_effects.camera_distance.math < #max.abs cse.status_effects.camera_distance.math run \
scoreboard players operation #base cse.status_effects.camera_distance.math += #value cse.status_effects.camera_distance.math

execute \
    if score #base.abs cse.status_effects.camera_distance.math >= #max.abs cse.status_effects.camera_distance.math run \
scoreboard players operation #base cse.status_effects.camera_distance.math = #max cse.status_effects.camera_distance.math

execute \
    store result entity @s data.cse.camera_distance.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.camera_distance.math