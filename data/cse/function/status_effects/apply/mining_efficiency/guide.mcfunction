
execute \
    if score @s cse.status_effects.mining_efficiency matches 1.. run \
function cse:status_effects/apply/mining_efficiency/timer

execute \
    if score @s cse.status_effects.mining_efficiency matches 0 run \
function cse:status_effects/apply/mining_efficiency/reset