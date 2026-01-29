execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.gravity.data,type=marker] at @s run \
function cse:status_effects/apply/gravity/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.gravity.data,type=marker] run \
schedule function cse:status_effects/apply/gravity/main 1t