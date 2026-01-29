execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.safe_fall_distance.data,type=marker] at @s run \
function cse:status_effects/apply/safe_fall_distance/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.safe_fall_distance.data,type=marker] run \
schedule function cse:status_effects/apply/safe_fall_distance/main 1t