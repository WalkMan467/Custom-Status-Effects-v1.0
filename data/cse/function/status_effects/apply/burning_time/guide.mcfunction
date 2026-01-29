
execute \
    if score @s cse.status_effects.burning_time matches 1.. run \
function cse:status_effects/apply/burning_time/timer

execute \
    if score @s cse.status_effects.burning_time matches 0 run \
function cse:status_effects/apply/burning_time/reset