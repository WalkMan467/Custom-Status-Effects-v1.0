execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.attack_knockback.data,type=marker] at @s run \
function cse:status_effects/apply/attack_knockback/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.attack_knockback.data,type=marker] run \
schedule function cse:status_effects/apply/attack_knockback/main 1t