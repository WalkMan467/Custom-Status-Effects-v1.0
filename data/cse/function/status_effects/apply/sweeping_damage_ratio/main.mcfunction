execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.sweeping_damage_ratio.data,type=marker] at @s run \
function cse:status_effects/apply/sweeping_damage_ratio/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.sweeping_damage_ratio.data,type=marker] run \
schedule function cse:status_effects/apply/sweeping_damage_ratio/main 1t