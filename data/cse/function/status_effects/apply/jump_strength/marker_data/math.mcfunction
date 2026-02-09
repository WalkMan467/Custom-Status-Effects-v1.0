# @s = Status Effects Marker

$data modify entity @s data.cse.jump_strength.add.value set value $(value)f
$data modify entity @s data.cse.jump_strength.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.jump_strength $(duration)

function cse:status_effects/apply/jump_strength/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.jump_strength.math run \
data get entity @s data.cse.jump_strength.add.value 1000

execute \
    store result score #base cse.status_effects.jump_strength.math run \
data get entity @s data.cse.jump_strength.base_value 1000

execute \
    store result score #max cse.status_effects.jump_strength.math run \
data get entity @s data.cse.jump_strength.max_value 1000

scoreboard players set #abs cse.global.main -1

scoreboard players set $abs cse.status_effects.jump_strength.math -1
scoreboard players operation #base.abs cse.status_effects.jump_strength.math = #base cse.status_effects.jump_strength.math
scoreboard players operation #max.abs cse.status_effects.jump_strength.math = #max cse.status_effects.jump_strength.math

execute \
    if score #base cse.status_effects.jump_strength.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.jump_strength.math *= $abs cse.status_effects.jump_strength.math

execute \
    if score #max cse.status_effects.jump_strength.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.jump_strength.math *= $abs cse.status_effects.jump_strength.math

execute \
    if score #base.abs cse.status_effects.jump_strength.math < #max.abs cse.status_effects.jump_strength.math run \
scoreboard players operation #base cse.status_effects.jump_strength.math += #value cse.status_effects.jump_strength.math

execute \
    if score #base.abs cse.status_effects.jump_strength.math >= #max.abs cse.status_effects.jump_strength.math run \
scoreboard players operation #base cse.status_effects.jump_strength.math = #max cse.status_effects.jump_strength.math

execute \
    store result entity @s data.cse.jump_strength.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.jump_strength.math