execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.attack_damage.data,type=marker] at @s run \
function cse:status_effects/apply/attack_damage/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.attack_damage.data,type=marker] run \
schedule function cse:status_effects/apply/attack_damage/main 1t