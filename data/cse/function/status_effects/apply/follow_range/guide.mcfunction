
execute \
    if score @s cse.status_effects.follow_range matches 1.. run \
function cse:status_effects/apply/follow_range/timer

execute \
    if score @s cse.status_effects.follow_range matches 0 run \
function cse:status_effects/apply/follow_range/reset