
execute \
    if score @s cse.status_effects.oxygen_bonus matches 1.. run \
function cse:status_effects/apply/oxygen_bonus/timer

execute \
    if score @s cse.status_effects.oxygen_bonus matches 0 run \
function cse:status_effects/apply/oxygen_bonus/reset