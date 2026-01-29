
execute \
    if score @s cse.status_effects.armor_toughness matches 1.. run \
function cse:status_effects/apply/armor_toughness/timer

execute \
    if score @s cse.status_effects.armor_toughness matches 0 run \
function cse:status_effects/apply/armor_toughness/reset