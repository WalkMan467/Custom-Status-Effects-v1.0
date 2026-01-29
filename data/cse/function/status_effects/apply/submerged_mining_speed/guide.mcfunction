
execute \
    if score @s cse.status_effects.submerged_mining_speed matches 1.. run \
function cse:status_effects/apply/submerged_mining_speed/timer

execute \
    if score @s cse.status_effects.submerged_mining_speed matches 0 run \
function cse:status_effects/apply/submerged_mining_speed/reset