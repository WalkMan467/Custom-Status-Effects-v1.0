execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.spawn_reinforcements.data,type=marker] at @s run \
function cse:status_effects/apply/spawn_reinforcements/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.spawn_reinforcements.data,type=marker] run \
schedule function cse:status_effects/apply/spawn_reinforcements/main 1t