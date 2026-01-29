execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.submerged_mining_speed.data,type=marker] at @s run \
function cse:status_effects/apply/submerged_mining_speed/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.submerged_mining_speed.data,type=marker] run \
schedule function cse:status_effects/apply/submerged_mining_speed/main 1t