
execute \
    if score @s cse.status_effects.movement_speed matches 1.. run \
function cse:status_effects/apply/movement_speed/timer

execute \
    if score @s cse.status_effects.movement_speed matches 0 run \
function cse:status_effects/apply/movement_speed/reset