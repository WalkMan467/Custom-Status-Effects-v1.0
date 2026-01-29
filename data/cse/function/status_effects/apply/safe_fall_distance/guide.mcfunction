
execute \
    if score @s cse.status_effects.safe_fall_distance matches 1.. run \
function cse:status_effects/apply/safe_fall_distance/timer

execute \
    if score @s cse.status_effects.safe_fall_distance matches 0 run \
function cse:status_effects/apply/safe_fall_distance/reset