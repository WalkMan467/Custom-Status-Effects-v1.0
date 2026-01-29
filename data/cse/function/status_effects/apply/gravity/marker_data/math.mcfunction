# @s = Status Effects Marker

$data modify entity @s data.cse.gravity.add.value set value $(value)f
$data modify entity @s data.cse.gravity.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.gravity $(duration)

function cse:status_effects/apply/gravity/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.gravity.math run \
data get entity @s data.cse.gravity.add.value 1000

execute \
    store result score #base cse.status_effects.gravity.math run \
data get entity @s data.cse.gravity.base_value 1000

execute \
    store result score #max cse.status_effects.gravity.math run \
data get entity @s data.cse.gravity.max_value 1000

scoreboard players set $abs cse.status_effects.gravity.math -1
scoreboard players operation #base.abs cse.status_effects.gravity.math = #base cse.status_effects.gravity.math
scoreboard players operation #max.abs cse.status_effects.gravity.math = #max cse.status_effects.gravity.math

execute \
    if score #base cse.status_effects.gravity.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.gravity.math *= $abs cse.status_effects.gravity.math

execute \
    if score #max cse.status_effects.gravity.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.gravity.math *= $abs cse.status_effects.gravity.math

execute \
    if score #base.abs cse.status_effects.gravity.math < #max.abs cse.status_effects.gravity.math run \
scoreboard players operation #base cse.status_effects.gravity.math += #value cse.status_effects.gravity.math

execute \
    if score #base.abs cse.status_effects.gravity.math >= #max.abs cse.status_effects.gravity.math run \
scoreboard players operation #base cse.status_effects.gravity.math = #max cse.status_effects.gravity.math

execute \
    store result entity @s data.cse.gravity.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.gravity.math