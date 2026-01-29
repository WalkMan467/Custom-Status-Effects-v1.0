execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status.effect.bleeding,type=!#cse:dummy_mob] at @s run \
function cse:status_effects/apply/bleeding/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status.effect.bleeding,type=!#cse:dummy_mob] run \
schedule function cse:status_effects/apply/bleeding/main 1t