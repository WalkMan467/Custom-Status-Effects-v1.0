execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.attack_speed.data,type=marker] at @s run \
function cse:status_effects/apply/attack_speed/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.attack_speed.data,type=marker] run \
schedule function cse:status_effects/apply/attack_speed/main 1t