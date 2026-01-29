
execute \
    if score @s cse.status_effects.spawn_reinforcements matches 1.. run \
function cse:status_effects/apply/spawn_reinforcements/timer

execute \
    if score @s cse.status_effects.spawn_reinforcements matches 0 run \
function cse:status_effects/apply/spawn_reinforcements/reset