execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.burning_time.data,type=marker] at @s run \
function cse:status_effects/apply/burning_time/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.burning_time.data,type=marker] run \
schedule function cse:status_effects/apply/burning_time/main 1t