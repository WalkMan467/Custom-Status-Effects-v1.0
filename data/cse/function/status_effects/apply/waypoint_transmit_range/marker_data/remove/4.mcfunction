scoreboard players reset @s cse.status_effects.waypoint_transmit_range
scoreboard players reset @s cse.status_effects.waypoint_transmit_range.base.value
scoreboard players reset @s cse.status_effects.waypoint_transmit_range.value.max
scoreboard players reset @s cse.status_effects.waypoint_transmit_range.value

function cse:status_effects/apply/waypoint_transmit_range/marker_data/remove/5

$attribute @s minecraft:waypoint_transmit_range modifier remove cse.status_effects.waypoint_transmit_range.$(id)