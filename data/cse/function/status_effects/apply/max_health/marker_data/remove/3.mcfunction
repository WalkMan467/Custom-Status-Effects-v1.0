tag @s add cse.status_effect.max_health.data_target.reset
tag @s add cse.status_effect.max_health.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.max_health,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.max_health.id = @n[sort=arbitrary,tag=cse.status_effect.max_health.data_target.reset,tag=cse.status_effect.max_health.id.$(id),tag=cse.status_effect.max_health.data,distance=0..,type=marker] cse.status_effects.max_health.id run \
function cse:status_effects/apply/max_health/marker_data/remove/4 {id:"$(id)"}