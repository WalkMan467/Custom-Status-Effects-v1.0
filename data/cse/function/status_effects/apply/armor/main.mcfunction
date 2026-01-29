execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.armor.data,type=marker] at @s run \
function cse:status_effects/apply/armor/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.armor.data,type=marker] run \
schedule function cse:status_effects/apply/armor/main 1t