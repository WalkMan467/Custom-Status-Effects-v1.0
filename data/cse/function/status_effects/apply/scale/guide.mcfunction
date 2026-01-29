
execute \
    if score @s cse.status_effects.scale matches 1.. run \
function cse:status_effects/apply/scale/timer

execute \
    if score @s cse.status_effects.scale matches 0 run \
function cse:status_effects/apply/scale/reset