# @s = Status Effects Marker

$data modify entity @s data.cse.fall_damage_multiplier.add.value set value $(value)f
$data modify entity @s data.cse.fall_damage_multiplier.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.fall_damage_multiplier $(duration)

function cse:status_effects/apply/fall_damage_multiplier/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.fall_damage_multiplier.math run \
data get entity @s data.cse.fall_damage_multiplier.add.value 1000

execute \
    store result score #base cse.status_effects.fall_damage_multiplier.math run \
data get entity @s data.cse.fall_damage_multiplier.base_value 1000

execute \
    store result score #max cse.status_effects.fall_damage_multiplier.math run \
data get entity @s data.cse.fall_damage_multiplier.max_value 1000

scoreboard players set #abs cse.global.main -1

scoreboard players set $abs cse.status_effects.fall_damage_multiplier.math -1
scoreboard players operation #base.abs cse.status_effects.fall_damage_multiplier.math = #base cse.status_effects.fall_damage_multiplier.math
scoreboard players operation #max.abs cse.status_effects.fall_damage_multiplier.math = #max cse.status_effects.fall_damage_multiplier.math

execute \
    if score #base cse.status_effects.fall_damage_multiplier.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.fall_damage_multiplier.math *= $abs cse.status_effects.fall_damage_multiplier.math

execute \
    if score #max cse.status_effects.fall_damage_multiplier.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.fall_damage_multiplier.math *= $abs cse.status_effects.fall_damage_multiplier.math

execute \
    if score #base.abs cse.status_effects.fall_damage_multiplier.math < #max.abs cse.status_effects.fall_damage_multiplier.math run \
scoreboard players operation #base cse.status_effects.fall_damage_multiplier.math += #value cse.status_effects.fall_damage_multiplier.math

execute \
    if score #base.abs cse.status_effects.fall_damage_multiplier.math >= #max.abs cse.status_effects.fall_damage_multiplier.math run \
scoreboard players operation #base cse.status_effects.fall_damage_multiplier.math = #max cse.status_effects.fall_damage_multiplier.math

execute \
    store result entity @s data.cse.fall_damage_multiplier.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.fall_damage_multiplier.math