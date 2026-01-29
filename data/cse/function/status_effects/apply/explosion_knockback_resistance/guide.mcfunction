
execute \
    if score @s cse.status_effects.explosion_knockback_resistance matches 1.. run \
function cse:status_effects/apply/explosion_knockback_resistance/timer

execute \
    if score @s cse.status_effects.explosion_knockback_resistance matches 0 run \
function cse:status_effects/apply/explosion_knockback_resistance/reset