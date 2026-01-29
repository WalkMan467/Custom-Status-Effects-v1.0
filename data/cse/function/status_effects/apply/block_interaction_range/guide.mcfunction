
execute \
    if score @s cse.status_effects.block_interaction_range matches 1.. run \
function cse:status_effects/apply/block_interaction_range/timer

execute \
    if score @s cse.status_effects.block_interaction_range matches 0 run \
function cse:status_effects/apply/block_interaction_range/reset