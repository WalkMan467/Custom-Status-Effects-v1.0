scoreboard players reset @s cse.status_effects.waypoint_receive_range
scoreboard players reset @s cse.status_effects.waypoint_receive_range.base.value
scoreboard players reset @s cse.status_effects.waypoint_receive_range.value.max
scoreboard players reset @s cse.status_effects.waypoint_receive_range.value

function cse:status_effects/apply/waypoint_receive_range/marker_data/remove/5

$attribute @s minecraft:waypoint_receive_range modifier remove cse.status_effects.waypoint_receive_range.$(id).$(type)