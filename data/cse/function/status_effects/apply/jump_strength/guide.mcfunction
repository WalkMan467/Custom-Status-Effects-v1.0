
execute \
    if score @s cse.status_effects.jump_strength matches 1.. run \
function cse:status_effects/apply/jump_strength/timer

execute \
    if score @s cse.status_effects.jump_strength matches 0 run \
function cse:status_effects/apply/jump_strength/reset