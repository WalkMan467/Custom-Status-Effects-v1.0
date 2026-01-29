# @s = Status Effects Marker

$data modify entity @s data.cse.burning_time.add.value set value $(value)f
$data modify entity @s data.cse.burning_time.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.burning_time $(duration)

function cse:status_effects/apply/burning_time/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.burning_time.math run \
data get entity @s data.cse.burning_time.add.value 1000

execute \
    store result score #base cse.status_effects.burning_time.math run \
data get entity @s data.cse.burning_time.base_value 1000

execute \
    store result score #max cse.status_effects.burning_time.math run \
data get entity @s data.cse.burning_time.max_value 1000

scoreboard players set $abs cse.status_effects.burning_time.math -1
scoreboard players operation #base.abs cse.status_effects.burning_time.math = #base cse.status_effects.burning_time.math
scoreboard players operation #max.abs cse.status_effects.burning_time.math = #max cse.status_effects.burning_time.math

execute \
    if score #base cse.status_effects.burning_time.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.burning_time.math *= $abs cse.status_effects.burning_time.math

execute \
    if score #max cse.status_effects.burning_time.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.burning_time.math *= $abs cse.status_effects.burning_time.math

execute \
    if score #base.abs cse.status_effects.burning_time.math < #max.abs cse.status_effects.burning_time.math run \
scoreboard players operation #base cse.status_effects.burning_time.math += #value cse.status_effects.burning_time.math

execute \
    if score #base.abs cse.status_effects.burning_time.math >= #max.abs cse.status_effects.burning_time.math run \
scoreboard players operation #base cse.status_effects.burning_time.math = #max cse.status_effects.burning_time.math

execute \
    store result entity @s data.cse.burning_time.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.burning_time.math