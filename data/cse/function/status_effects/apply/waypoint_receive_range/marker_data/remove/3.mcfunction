tag @s add cse.status_effect.waypoint_receive_range.data_target.reset
tag @s add cse.status_effect.waypoint_receive_range.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.waypoint_receive_range,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.waypoint_receive_range.id = @n[sort=arbitrary,tag=cse.status_effect.waypoint_receive_range.data_target.reset,tag=cse.status_effect.waypoint_receive_range.id.$(id),tag=cse.status_effect.waypoint_receive_range.data,distance=0..,type=marker] cse.status_effects.waypoint_receive_range.id run \
function cse:status_effects/apply/waypoint_receive_range/marker_data/remove/4 {id:"$(id)"}