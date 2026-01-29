execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.movement_efficiency.data,type=marker] at @s run \
function cse:status_effects/apply/movement_efficiency/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.movement_efficiency.data,type=marker] run \
schedule function cse:status_effects/apply/movement_efficiency/main 1t