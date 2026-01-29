
execute \
    if score @s cse.status_effects.luck matches 1.. run \
function cse:status_effects/apply/luck/timer

execute \
    if score @s cse.status_effects.luck matches 0 run \
function cse:status_effects/apply/luck/reset