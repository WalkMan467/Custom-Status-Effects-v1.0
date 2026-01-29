execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.jump_strength.data,type=marker] at @s run \
function cse:status_effects/apply/jump_strength/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.jump_strength.data,type=marker] run \
schedule function cse:status_effects/apply/jump_strength/main 1t