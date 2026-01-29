tag @s add cse.status_effect.armor.data_target.reset
tag @s add cse.status_effect.armor.data_target.kill

$execute \
    as @e[sort=arbitrary,tag=cse.status_effect.armor,distance=0..,type=!#cse:dummy_mob] at @s \
    if score @s cse.status_effects.armor.id = @n[sort=arbitrary,tag=cse.status_effect.armor.data_target.reset,tag=cse.status_effect.armor.id.$(id),tag=cse.status_effect.armor.data,distance=0..,type=marker] cse.status_effects.armor.id run \
function cse:status_effects/apply/armor/marker_data/remove/4 {id:"$(id)"}