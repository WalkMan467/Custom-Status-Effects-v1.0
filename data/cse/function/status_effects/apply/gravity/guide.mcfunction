
execute \
    if score @s cse.status_effects.gravity matches 1.. run \
function cse:status_effects/apply/gravity/timer

execute \
    if score @s cse.status_effects.gravity matches 0 run \
function cse:status_effects/apply/gravity/reset