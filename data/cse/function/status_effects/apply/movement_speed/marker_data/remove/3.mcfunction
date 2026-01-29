tag @s add cse.status_effect.movement_speed.data_target.reset
tag @s add cse.status_effect.movement_speed.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.movement_speed,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.movement_speed.id = @n[sort=arbitrary,tag=cse.status_effect.movement_speed.data_target.reset,tag=cse.status_effect.movement_speed.id.$(id),tag=cse.status_effect.movement_speed.data,distance=0..,type=marker] cse.status_effects.movement_speed.id run \
function cse:status_effects/apply/movement_speed/marker_data/remove/4 {id:"$(id)"}