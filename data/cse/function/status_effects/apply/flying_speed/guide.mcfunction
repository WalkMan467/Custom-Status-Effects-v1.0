
execute \
    if score @s cse.status_effects.flying_speed matches 1.. run \
function cse:status_effects/apply/flying_speed/timer

execute \
    if score @s cse.status_effects.flying_speed matches 0 run \
function cse:status_effects/apply/flying_speed/reset