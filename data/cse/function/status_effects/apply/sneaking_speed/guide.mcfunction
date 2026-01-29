
execute \
    if score @s cse.status_effects.sneaking_speed matches 1.. run \
function cse:status_effects/apply/sneaking_speed/timer

execute \
    if score @s cse.status_effects.sneaking_speed matches 0 run \
function cse:status_effects/apply/sneaking_speed/reset