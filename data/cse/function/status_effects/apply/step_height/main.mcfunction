execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.step_height.data,type=marker] at @s run \
function cse:status_effects/apply/step_height/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.step_height.data,type=marker] run \
schedule function cse:status_effects/apply/step_height/main 1t