
execute \
    if score @s cse.status_effects.step_height matches 1.. run \
function cse:status_effects/apply/step_height/timer

execute \
    if score @s cse.status_effects.step_height matches 0 run \
function cse:status_effects/apply/step_height/reset