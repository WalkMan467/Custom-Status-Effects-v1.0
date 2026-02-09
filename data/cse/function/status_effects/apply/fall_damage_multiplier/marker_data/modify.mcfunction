tag @s add cse.status_effect.fall_damage_multiplier.data_target
tag @s add cse.status_effect.fall_damage_multiplier.user

execute \
    as @e[tag=cse.status_effect.fall_damage_multiplier.data,distance=0..,type=marker] \
    if score @s cse.status_effects.fall_damage_multiplier.id = @n[tag=cse.status_effect.fall_damage_multiplier.user,tag=cse.status_effect.fall_damage_multiplier.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.fall_damage_multiplier.id run \
tag @s add cse.status_effect.fall_damage_multiplier.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.fall_damage_multiplier.id.$(id),tag=cse.status_effect.fall_damage_multiplier.$(type),tag=cse.status_effect.fall_damage_multiplier.data_target,tag=cse.status_effect.fall_damage_multiplier.data,distance=0..,type=marker] run \
function cse:status_effects/apply/fall_damage_multiplier/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:fall_damage_multiplier modifier remove cse.status_effects.fall_damage_multiplier.$(id).$(type)
data modify storage cse:status_effects fall_damage_multiplier.final_value.value set from entity @n[tag=cse.status_effect.fall_damage_multiplier.data,tag=cse.status_effect.fall_damage_multiplier.data_target,distance=0..,type=marker] data.cse.fall_damage_multiplier.base_value
$data modify storage cse:status_effects fall_damage_multiplier.final_value.type set value "$(type)"
$data modify storage cse:status_effects fall_damage_multiplier.final_value.id set value "$(id)"
function cse:status_effects/apply/fall_damage_multiplier/marker_data/merge with storage cse:status_effects fall_damage_multiplier.final_value

data modify storage temp2 temp set from storage cse:status_effects fall_damage_multiplier.final_value
data remove storage cse:status_effects fall_damage_multiplier

tag @s remove cse.status_effect.fall_damage_multiplier.data_target
tag @s remove cse.status_effect.fall_damage_multiplier.user

tag @e[sort=arbitrary,tag=cse.status_effect.fall_damage_multiplier.data_target,tag=cse.status_effect.fall_damage_multiplier.data,distance=0..,type=marker] remove cse.status_effect.fall_damage_multiplier.data_target