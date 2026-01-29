
execute \
    if score @s cse.status_effects.fall_damage_multiplier matches 1.. run \
function cse:status_effects/apply/fall_damage_multiplier/timer

execute \
    if score @s cse.status_effects.fall_damage_multiplier matches 0 run \
function cse:status_effects/apply/fall_damage_multiplier/reset