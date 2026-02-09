tag @s add cse.status_effect.safe_fall_distance.data_target.reset
tag @s add cse.status_effect.safe_fall_distance.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.safe_fall_distance,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.safe_fall_distance.id = @n[sort=arbitrary,tag=cse.status_effect.safe_fall_distance.data_target.reset,tag=cse.status_effect.safe_fall_distance.id.$(id),tag=cse.status_effect.safe_fall_distance.$(type),tag=cse.status_effect.safe_fall_distance.data,distance=0..,type=marker] cse.status_effects.safe_fall_distance.id run \
function cse:status_effects/apply/safe_fall_distance/marker_data/remove/4 {id:"$(id)",type:"$(type)"}