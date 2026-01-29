# @s = Status Effects Marker

$data modify entity @s data.cse.waypoint_transmit_range.add.value set value $(value)f
$data modify entity @s data.cse.waypoint_transmit_range.max_value set value $(max)f
$scoreboard players set @s cse.status_effects.waypoint_transmit_range $(duration)

function cse:status_effects/apply/waypoint_transmit_range/marker_data/add/2 with entity @s data.cse

execute \
    store result score #value cse.status_effects.waypoint_transmit_range.math run \
data get entity @s data.cse.waypoint_transmit_range.add.value 1000

execute \
    store result score #base cse.status_effects.waypoint_transmit_range.math run \
data get entity @s data.cse.waypoint_transmit_range.base_value 1000

execute \
    store result score #max cse.status_effects.waypoint_transmit_range.math run \
data get entity @s data.cse.waypoint_transmit_range.max_value 1000

scoreboard players set $abs cse.status_effects.waypoint_transmit_range.math -1
scoreboard players operation #base.abs cse.status_effects.waypoint_transmit_range.math = #base cse.status_effects.waypoint_transmit_range.math
scoreboard players operation #max.abs cse.status_effects.waypoint_transmit_range.math = #max cse.status_effects.waypoint_transmit_range.math

execute \
    if score #base cse.status_effects.waypoint_transmit_range.math matches ..0 run \
scoreboard players operation #base.abs cse.status_effects.waypoint_transmit_range.math *= $abs cse.status_effects.waypoint_transmit_range.math

execute \
    if score #max cse.status_effects.waypoint_transmit_range.math matches ..0 run \
scoreboard players operation #max.abs cse.status_effects.waypoint_transmit_range.math *= $abs cse.status_effects.waypoint_transmit_range.math

execute \
    if score #base.abs cse.status_effects.waypoint_transmit_range.math < #max.abs cse.status_effects.waypoint_transmit_range.math run \
scoreboard players operation #base cse.status_effects.waypoint_transmit_range.math += #value cse.status_effects.waypoint_transmit_range.math

execute \
    if score #base.abs cse.status_effects.waypoint_transmit_range.math >= #max.abs cse.status_effects.waypoint_transmit_range.math run \
scoreboard players operation #base cse.status_effects.waypoint_transmit_range.math = #max cse.status_effects.waypoint_transmit_range.math

execute \
    store result entity @s data.cse.waypoint_transmit_range.base_value float 0.001 run \
scoreboard players get #base cse.status_effects.waypoint_transmit_range.math