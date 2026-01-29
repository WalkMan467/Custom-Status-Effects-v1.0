
execute \
    if score @s cse.status_effects.max_absorption matches 1.. run \
function cse:status_effects/apply/max_absorption/timer

execute \
    if score @s cse.status_effects.max_absorption matches 0 run \
function cse:status_effects/apply/max_absorption/reset