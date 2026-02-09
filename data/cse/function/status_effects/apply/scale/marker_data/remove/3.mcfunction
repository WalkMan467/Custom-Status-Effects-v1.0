tag @s add cse.status_effect.scale.data_target.reset
tag @s add cse.status_effect.scale.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.scale,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.scale.id = @n[sort=arbitrary,tag=cse.status_effect.scale.data_target.reset,tag=cse.status_effect.scale.id.$(id),tag=cse.status_effect.scale.$(type),tag=cse.status_effect.scale.data,distance=0..,type=marker] cse.status_effects.scale.id run \
function cse:status_effects/apply/scale/marker_data/remove/4 {id:"$(id)",type:"$(type)"}