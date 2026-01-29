
execute \
    if score @s cse.status_effects.tempt_range matches 1.. run \
function cse:status_effects/apply/tempt_range/timer

execute \
    if score @s cse.status_effects.tempt_range matches 0 run \
function cse:status_effects/apply/tempt_range/reset