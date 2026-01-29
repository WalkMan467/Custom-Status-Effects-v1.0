
execute \
    if score @s cse.status_effects.block_break_speed matches 1.. run \
function cse:status_effects/apply/block_break_speed/timer

execute \
    if score @s cse.status_effects.block_break_speed matches 0 run \
function cse:status_effects/apply/block_break_speed/reset