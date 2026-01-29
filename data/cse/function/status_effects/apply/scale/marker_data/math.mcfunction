# @s = Status Effects Marker

$data modify entity @s data.cse.scale.add.value set value $(value)f
$data modify entity @s data.cse.scale.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.scale $(duration)

function cse:status_effects/apply/scale/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.scale.math run \
data get entity @s data.cse.scale.add.value 1000

execute \
    store result score #base cse.status_effects.scale.math run \
data get entity @s data.cse.scale.base_value 1000

execute \
    store result score #max cse.status_effects.scale.math run \
data get entity @s data.cse.scale.max_value 1000

scoreboard players set $abs cse.status_effects.scale.math -1
scoreboard players operation #base.abs cse.status_effects.scale.math = #base cse.status_effects.scale.math
scoreboard players operation #max.abs cse.status_effects.scale.math = #max cse.status_effects.scale.math

execute \
    if score #base cse.status_effects.scale.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.scale.math *= $abs cse.status_effects.scale.math

execute \
    if score #max cse.status_effects.scale.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.scale.math *= $abs cse.status_effects.scale.math

execute \
    if score #base.abs cse.status_effects.scale.math < #max.abs cse.status_effects.scale.math run \
scoreboard players operation #base cse.status_effects.scale.math += #value cse.status_effects.scale.math

execute \
    if score #base.abs cse.status_effects.scale.math >= #max.abs cse.status_effects.scale.math run \
scoreboard players operation #base cse.status_effects.scale.math = #max cse.status_effects.scale.math

execute \
    store result entity @s data.cse.scale.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.scale.math