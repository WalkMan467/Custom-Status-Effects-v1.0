
execute \
    if score @s cse.status_effects.attack_knockback matches 1.. run \
function cse:status_effects/apply/attack_knockback/timer

execute \
    if score @s cse.status_effects.attack_knockback matches 0 run \
function cse:status_effects/apply/attack_knockback/reset