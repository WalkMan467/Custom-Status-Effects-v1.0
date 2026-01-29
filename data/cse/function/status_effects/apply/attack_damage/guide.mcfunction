
execute \
    if score @s cse.status_effects.attack_damage matches 1.. run \
function cse:status_effects/apply/attack_damage/timer

execute \
    if score @s cse.status_effects.attack_damage matches 0 run \
function cse:status_effects/apply/attack_damage/reset