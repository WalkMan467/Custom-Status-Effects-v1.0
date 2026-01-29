tag @s add cse.status_effect.armor_toughness.data_target
tag @s add cse.status_effect.armor_toughness.user

execute \
    as @e[tag=cse.status_effect.armor_toughness.data,distance=0..,type=marker] \
    if score @s cse.status_effects.armor_toughness.id = @n[tag=cse.status_effect.armor_toughness.user,tag=cse.status_effect.armor_toughness.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.armor_toughness.id run \
tag @s add cse.status_effect.armor_toughness.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.armor_toughness.id.$(id),tag=cse.status_effect.armor_toughness.data_target,tag=cse.status_effect.armor_toughness.data,distance=0..,type=marker] run \
function cse:status_effects/apply/armor_toughness/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:armor_toughness modifier remove cse.status_effects.armor_toughness.$(id)
data modify storage cse:status_effects armor_toughness.final_value.value set from entity @n[tag=cse.status_effect.armor_toughness.data,tag=cse.status_effect.armor_toughness.data_target,distance=0..,type=marker] data.cse.armor_toughness.base_value

$data modify storage cse:status_effects armor_toughness.final_value.id set value "$(id)"
function cse:status_effects/apply/armor_toughness/marker_data/merge with storage cse:status_effects armor_toughness.final_value

data remove storage cse:status_effects armor_toughness

tag @s remove cse.status_effect.armor_toughness.data_target
tag @s remove cse.status_effect.armor_toughness.user

tag @e[sort=arbitrary,tag=cse.status_effect.armor_toughness.data_target,tag=cse.status_effect.armor_toughness.data,distance=0..,type=marker] remove cse.status_effect.armor_toughness.data_target