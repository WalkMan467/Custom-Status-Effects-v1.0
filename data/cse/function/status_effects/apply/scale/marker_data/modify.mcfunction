tag @s add cse.status_effect.scale.data_target
tag @s add cse.status_effect.scale.user

execute \
    as @e[tag=cse.status_effect.scale.data,distance=0..,type=marker] \
    if score @s cse.status_effects.scale.id = @n[tag=cse.status_effect.scale.user,tag=cse.status_effect.scale.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.scale.id run \
tag @s add cse.status_effect.scale.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.scale.id.$(id),tag=cse.status_effect.scale.$(type),tag=cse.status_effect.scale.data_target,tag=cse.status_effect.scale.data,distance=0..,type=marker] run \
function cse:status_effects/apply/scale/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:scale modifier remove cse.status_effects.scale.$(id).$(type)
data modify storage cse:status_effects scale.final_value.value set from entity @n[tag=cse.status_effect.scale.data,tag=cse.status_effect.scale.data_target,distance=0..,type=marker] data.cse.scale.base_value
$data modify storage cse:status_effects scale.final_value.type set value "$(type)"
$data modify storage cse:status_effects scale.final_value.id set value "$(id)"
function cse:status_effects/apply/scale/marker_data/merge with storage cse:status_effects scale.final_value

data modify storage temp2 temp set from storage cse:status_effects scale.final_value
data remove storage cse:status_effects scale

tag @s remove cse.status_effect.scale.data_target
tag @s remove cse.status_effect.scale.user

tag @e[sort=arbitrary,tag=cse.status_effect.scale.data_target,tag=cse.status_effect.scale.data,distance=0..,type=marker] remove cse.status_effect.scale.data_target