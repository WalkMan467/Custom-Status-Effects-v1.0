# @s = Status Effects Marker

$data modify entity @s data.cse.oxygen_bonus.add.value set value $(value)f
$data modify entity @s data.cse.oxygen_bonus.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.oxygen_bonus $(duration)

function cse:status_effects/apply/oxygen_bonus/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.oxygen_bonus.math run \
data get entity @s data.cse.oxygen_bonus.add.value 1000

execute \
    store result score #base cse.status_effects.oxygen_bonus.math run \
data get entity @s data.cse.oxygen_bonus.base_value 1000

execute \
    store result score #max cse.status_effects.oxygen_bonus.math run \
data get entity @s data.cse.oxygen_bonus.max_value 1000

scoreboard players set $abs cse.status_effects.oxygen_bonus.math -1
scoreboard players operation #base.abs cse.status_effects.oxygen_bonus.math = #base cse.status_effects.oxygen_bonus.math
scoreboard players operation #max.abs cse.status_effects.oxygen_bonus.math = #max cse.status_effects.oxygen_bonus.math

execute \
    if score #base cse.status_effects.oxygen_bonus.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.oxygen_bonus.math *= $abs cse.status_effects.oxygen_bonus.math

execute \
    if score #max cse.status_effects.oxygen_bonus.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.oxygen_bonus.math *= $abs cse.status_effects.oxygen_bonus.math

execute \
    if score #base.abs cse.status_effects.oxygen_bonus.math < #max.abs cse.status_effects.oxygen_bonus.math run \
scoreboard players operation #base cse.status_effects.oxygen_bonus.math += #value cse.status_effects.oxygen_bonus.math

execute \
    if score #base.abs cse.status_effects.oxygen_bonus.math >= #max.abs cse.status_effects.oxygen_bonus.math run \
scoreboard players operation #base cse.status_effects.oxygen_bonus.math = #max cse.status_effects.oxygen_bonus.math

execute \
    store result entity @s data.cse.oxygen_bonus.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.oxygen_bonus.math