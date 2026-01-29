execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.max_health.data,type=marker] at @s run \
function cse:status_effects/apply/max_health/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.max_health.data,type=marker] run \
schedule function cse:status_effects/apply/max_health/main 1t