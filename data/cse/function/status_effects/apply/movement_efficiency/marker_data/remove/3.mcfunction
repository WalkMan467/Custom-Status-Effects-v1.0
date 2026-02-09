tag @s add cse.status_effect.movement_efficiency.data_target.reset
tag @s add cse.status_effect.movement_efficiency.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.movement_efficiency,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.movement_efficiency.id = @n[sort=arbitrary,tag=cse.status_effect.movement_efficiency.data_target.reset,tag=cse.status_effect.movement_efficiency.id.$(id),tag=cse.status_effect.movement_efficiency.$(type),tag=cse.status_effect.movement_efficiency.data,distance=0..,type=marker] cse.status_effects.movement_efficiency.id run \
function cse:status_effects/apply/movement_efficiency/marker_data/remove/4 {id:"$(id)",type:"$(type)"}