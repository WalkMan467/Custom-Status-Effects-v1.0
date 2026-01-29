execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.armor_toughness.data,type=marker] at @s run \
function cse:status_effects/apply/armor_toughness/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.armor_toughness.data,type=marker] run \
schedule function cse:status_effects/apply/armor_toughness/main 1t