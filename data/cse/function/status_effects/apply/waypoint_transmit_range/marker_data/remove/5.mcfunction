execute \
    if score @s cse.status_effects.waypoint_transmit_range.id = @n[sort=arbitrary,tag=!cse.status_effect.waypoint_transmit_range.data_target.kill,tag=cse.status_effect.waypoint_transmit_range.data,distance=0..,type=marker] cse.status_effects.waypoint_transmit_range.id run \
return 0

tag @s remove cse.status_effect.waypoint_transmit_range

scoreboard players set #reset.waypoint_transmit_range cse.global.main 1