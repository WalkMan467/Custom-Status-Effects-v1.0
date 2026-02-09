tag @s add cse.status_effect.armor.data_target
tag @s add cse.status_effect.armor.user

execute \
    as @e[tag=cse.status_effect.armor.data,distance=0..,type=marker] \
    if score @s cse.status_effects.armor.id = @n[tag=cse.status_effect.armor.user,tag=cse.status_effect.armor.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.armor.id run \
tag @s add cse.status_effect.armor.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.armor.id.$(id),tag=cse.status_effect.armor.$(type),tag=cse.status_effect.armor.data_target,tag=cse.status_effect.armor.data,distance=0..,type=marker] run \
function cse:status_effects/apply/armor/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:armor modifier remove cse.status_effects.armor.$(id).$(type)
data modify storage cse:status_effects armor.final_value.value set from entity @n[tag=cse.status_effect.armor.data,tag=cse.status_effect.armor.data_target,distance=0..,type=marker] data.cse.armor.base_value
$data modify storage cse:status_effects armor.final_value.type set value "$(type)"
$data modify storage cse:status_effects armor.final_value.id set value "$(id)"
function cse:status_effects/apply/armor/marker_data/merge with storage cse:status_effects armor.final_value

data modify storage temp2 temp set from storage cse:status_effects armor.final_value
data remove storage cse:status_effects armor

tag @s remove cse.status_effect.armor.data_target
tag @s remove cse.status_effect.armor.user

tag @e[sort=arbitrary,tag=cse.status_effect.armor.data_target,tag=cse.status_effect.armor.data,distance=0..,type=marker] remove cse.status_effect.armor.data_target