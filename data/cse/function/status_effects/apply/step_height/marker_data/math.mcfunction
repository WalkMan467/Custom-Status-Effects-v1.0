# @s = Status Effects Marker

$data modify entity @s data.cse.step_height.add.value set value $(value)f
$data modify entity @s data.cse.step_height.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.step_height $(duration)

function cse:status_effects/apply/step_height/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.step_height.math run \
data get entity @s data.cse.step_height.add.value 1000

execute \
    store result score #base cse.status_effects.step_height.math run \
data get entity @s data.cse.step_height.base_value 1000

execute \
    store result score #max cse.status_effects.step_height.math run \
data get entity @s data.cse.step_height.max_value 1000

scoreboard players set #abs cse.global.main -1

scoreboard players set $abs cse.status_effects.step_height.math -1
scoreboard players operation #base.abs cse.status_effects.step_height.math = #base cse.status_effects.step_height.math
scoreboard players operation #max.abs cse.status_effects.step_height.math = #max cse.status_effects.step_height.math

execute \
    if score #base cse.status_effects.step_height.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.step_height.math *= $abs cse.status_effects.step_height.math

execute \
    if score #max cse.status_effects.step_height.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.step_height.math *= $abs cse.status_effects.step_height.math

execute \
    if score #base.abs cse.status_effects.step_height.math < #max.abs cse.status_effects.step_height.math run \
scoreboard players operation #base cse.status_effects.step_height.math += #value cse.status_effects.step_height.math

execute \
    if score #base.abs cse.status_effects.step_height.math >= #max.abs cse.status_effects.step_height.math run \
scoreboard players operation #base cse.status_effects.step_height.math = #max cse.status_effects.step_height.math

execute \
    store result entity @s data.cse.step_height.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.step_height.math