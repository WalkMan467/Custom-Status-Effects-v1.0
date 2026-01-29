
execute \
    if score @s cse.status_effects.sweeping_damage_ratio matches 1.. run \
function cse:status_effects/apply/sweeping_damage_ratio/timer

execute \
    if score @s cse.status_effects.sweeping_damage_ratio matches 0 run \
function cse:status_effects/apply/sweeping_damage_ratio/reset