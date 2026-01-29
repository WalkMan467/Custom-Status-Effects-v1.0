tag @s add cse.status_effect.burning_time.data_target.reset
tag @s add cse.status_effect.burning_time.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.burning_time,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.burning_time.id = @n[sort=arbitrary,tag=cse.status_effect.burning_time.data_target.reset,tag=cse.status_effect.burning_time.id.$(id),tag=cse.status_effect.burning_time.data,distance=0..,type=marker] cse.status_effects.burning_time.id run \
function cse:status_effects/apply/burning_time/marker_data/remove/4 {id:"$(id)"}