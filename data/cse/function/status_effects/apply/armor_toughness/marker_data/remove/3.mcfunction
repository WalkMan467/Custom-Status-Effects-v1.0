tag @s add cse.status_effect.armor_toughness.data_target.reset
tag @s add cse.status_effect.armor_toughness.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.armor_toughness,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.armor_toughness.id = @n[sort=arbitrary,tag=cse.status_effect.armor_toughness.data_target.reset,tag=cse.status_effect.armor_toughness.id.$(id),tag=cse.status_effect.armor_toughness.data,distance=0..,type=marker] cse.status_effects.armor_toughness.id run \
function cse:status_effects/apply/armor_toughness/marker_data/remove/4 {id:"$(id)"}