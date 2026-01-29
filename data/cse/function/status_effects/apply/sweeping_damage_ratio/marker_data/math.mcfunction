# @s = Status Effects Marker

$data modify entity @s data.cse.sweeping_damage_ratio.add.value set value $(value)f
$data modify entity @s data.cse.sweeping_damage_ratio.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.sweeping_damage_ratio $(duration)

function cse:status_effects/apply/sweeping_damage_ratio/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.sweeping_damage_ratio.math run \
data get entity @s data.cse.sweeping_damage_ratio.add.value 1000

execute \
    store result score #base cse.status_effects.sweeping_damage_ratio.math run \
data get entity @s data.cse.sweeping_damage_ratio.base_value 1000

execute \
    store result score #max cse.status_effects.sweeping_damage_ratio.math run \
data get entity @s data.cse.sweeping_damage_ratio.max_value 1000

scoreboard players set $abs cse.status_effects.sweeping_damage_ratio.math -1
scoreboard players operation #base.abs cse.status_effects.sweeping_damage_ratio.math = #base cse.status_effects.sweeping_damage_ratio.math
scoreboard players operation #max.abs cse.status_effects.sweeping_damage_ratio.math = #max cse.status_effects.sweeping_damage_ratio.math

execute \
    if score #base cse.status_effects.sweeping_damage_ratio.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.sweeping_damage_ratio.math *= $abs cse.status_effects.sweeping_damage_ratio.math

execute \
    if score #max cse.status_effects.sweeping_damage_ratio.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.sweeping_damage_ratio.math *= $abs cse.status_effects.sweeping_damage_ratio.math

execute \
    if score #base.abs cse.status_effects.sweeping_damage_ratio.math < #max.abs cse.status_effects.sweeping_damage_ratio.math run \
scoreboard players operation #base cse.status_effects.sweeping_damage_ratio.math += #value cse.status_effects.sweeping_damage_ratio.math

execute \
    if score #base.abs cse.status_effects.sweeping_damage_ratio.math >= #max.abs cse.status_effects.sweeping_damage_ratio.math run \
scoreboard players operation #base cse.status_effects.sweeping_damage_ratio.math = #max cse.status_effects.sweeping_damage_ratio.math

execute \
    store result entity @s data.cse.sweeping_damage_ratio.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.sweeping_damage_ratio.math