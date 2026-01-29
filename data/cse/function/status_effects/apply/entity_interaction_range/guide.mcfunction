
execute \
    if score @s cse.status_effects.entity_interaction_range matches 1.. run \
function cse:status_effects/apply/entity_interaction_range/timer

execute \
    if score @s cse.status_effects.entity_interaction_range matches 0 run \
function cse:status_effects/apply/entity_interaction_range/reset