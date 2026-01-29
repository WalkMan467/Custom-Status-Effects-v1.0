
execute \
    if score @s cse.status_effects.waypoint_receive_range matches 1.. run \
function cse:status_effects/apply/waypoint_receive_range/timer

execute \
    if score @s cse.status_effects.waypoint_receive_range matches 0 run \
function cse:status_effects/apply/waypoint_receive_range/reset