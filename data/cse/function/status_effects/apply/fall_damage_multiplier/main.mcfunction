execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.fall_damage_multiplier.data,type=marker] at @s run \
function cse:status_effects/apply/fall_damage_multiplier/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.fall_damage_multiplier.data,type=marker] run \
schedule function cse:status_effects/apply/fall_damage_multiplier/main 1t