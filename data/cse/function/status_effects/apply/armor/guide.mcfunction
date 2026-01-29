
execute \
    if score @s cse.status_effects.armor matches 1.. run \
function cse:status_effects/apply/armor/timer

execute \
    if score @s cse.status_effects.armor matches 0 run \
function cse:status_effects/apply/armor/reset