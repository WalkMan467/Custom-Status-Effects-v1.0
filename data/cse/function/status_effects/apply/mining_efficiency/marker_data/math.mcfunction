# @s = Status Effects Marker

$data modify entity @s data.cse.mining_efficiency.add.value set value $(value)f
$data modify entity @s data.cse.mining_efficiency.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.mining_efficiency $(duration)

function cse:status_effects/apply/mining_efficiency/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.mining_efficiency.math run \
data get entity @s data.cse.mining_efficiency.add.value 1000

execute \
    store result score #base cse.status_effects.mining_efficiency.math run \
data get entity @s data.cse.mining_efficiency.base_value 1000

execute \
    store result score #max cse.status_effects.mining_efficiency.math run \
data get entity @s data.cse.mining_efficiency.max_value 1000

scoreboard players set $abs cse.status_effects.mining_efficiency.math -1
scoreboard players operation #base.abs cse.status_effects.mining_efficiency.math = #base cse.status_effects.mining_efficiency.math
scoreboard players operation #max.abs cse.status_effects.mining_efficiency.math = #max cse.status_effects.mining_efficiency.math

execute \
    if score #base cse.status_effects.mining_efficiency.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.mining_efficiency.math *= $abs cse.status_effects.mining_efficiency.math

execute \
    if score #max cse.status_effects.mining_efficiency.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.mining_efficiency.math *= $abs cse.status_effects.mining_efficiency.math

execute \
    if score #base.abs cse.status_effects.mining_efficiency.math < #max.abs cse.status_effects.mining_efficiency.math run \
scoreboard players operation #base cse.status_effects.mining_efficiency.math += #value cse.status_effects.mining_efficiency.math

execute \
    if score #base.abs cse.status_effects.mining_efficiency.math >= #max.abs cse.status_effects.mining_efficiency.math run \
scoreboard players operation #base cse.status_effects.mining_efficiency.math = #max cse.status_effects.mining_efficiency.math

execute \
    store result entity @s data.cse.mining_efficiency.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.mining_efficiency.math