execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.oxygen_bonus.data,type=marker] at @s run \
function cse:status_effects/apply/oxygen_bonus/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.oxygen_bonus.data,type=marker] run \
schedule function cse:status_effects/apply/oxygen_bonus/main 1t