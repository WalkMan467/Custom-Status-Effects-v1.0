execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.scale.data,type=marker] at @s run \
function cse:status_effects/apply/scale/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.scale.data,type=marker] run \
schedule function cse:status_effects/apply/scale/main 1t