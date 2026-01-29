execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.explosion_knockback_resistance.data,type=marker] at @s run \
function cse:status_effects/apply/explosion_knockback_resistance/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.explosion_knockback_resistance.data,type=marker] run \
schedule function cse:status_effects/apply/explosion_knockback_resistance/main 1t