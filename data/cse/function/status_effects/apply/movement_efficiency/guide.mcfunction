
execute \
    if score @s cse.status_effects.movement_efficiency matches 1.. run \
function cse:status_effects/apply/movement_efficiency/timer

execute \
    if score @s cse.status_effects.movement_efficiency matches 0 run \
function cse:status_effects/apply/movement_efficiency/reset