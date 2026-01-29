execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.luck.data,type=marker] at @s run \
function cse:status_effects/apply/luck/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.luck.data,type=marker] run \
schedule function cse:status_effects/apply/luck/main 1t