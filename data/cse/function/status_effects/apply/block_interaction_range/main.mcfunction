execute \
    as @e[sort=arbitrary,distance=0..,tag=cse.status_effect.block_interaction_range.data,type=marker] at @s run \
function cse:status_effects/apply/block_interaction_range/guide

execute \
    if entity @n[sort=arbitrary,distance=0..,tag=cse.status_effect.block_interaction_range.data,type=marker] run \
schedule function cse:status_effects/apply/block_interaction_range/main 1t