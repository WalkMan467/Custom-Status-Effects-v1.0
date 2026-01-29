
execute \
    if score @s cse.status_effects.max_health matches 1.. run \
function cse:status_effects/apply/max_health/timer

execute \
    if score @s cse.status_effects.max_health matches 0 run \
function cse:status_effects/apply/max_health/reset