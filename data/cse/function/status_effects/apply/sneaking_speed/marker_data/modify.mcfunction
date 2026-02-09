tag @s add cse.status_effect.sneaking_speed.data_target
tag @s add cse.status_effect.sneaking_speed.user

execute \
    as @e[tag=cse.status_effect.sneaking_speed.data,distance=0..,type=marker] \
    if score @s cse.status_effects.sneaking_speed.id = @n[tag=cse.status_effect.sneaking_speed.user,tag=cse.status_effect.sneaking_speed.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.sneaking_speed.id run \
tag @s add cse.status_effect.sneaking_speed.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.sneaking_speed.id.$(id),tag=cse.status_effect.sneaking_speed.$(type),tag=cse.status_effect.sneaking_speed.data_target,tag=cse.status_effect.sneaking_speed.data,distance=0..,type=marker] run \
function cse:status_effects/apply/sneaking_speed/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:sneaking_speed modifier remove cse.status_effects.sneaking_speed.$(id).$(type)
data modify storage cse:status_effects sneaking_speed.final_value.value set from entity @n[tag=cse.status_effect.sneaking_speed.data,tag=cse.status_effect.sneaking_speed.data_target,distance=0..,type=marker] data.cse.sneaking_speed.base_value
$data modify storage cse:status_effects sneaking_speed.final_value.type set value "$(type)"
$data modify storage cse:status_effects sneaking_speed.final_value.id set value "$(id)"
function cse:status_effects/apply/sneaking_speed/marker_data/merge with storage cse:status_effects sneaking_speed.final_value

data modify storage temp2 temp set from storage cse:status_effects sneaking_speed.final_value
data remove storage cse:status_effects sneaking_speed

tag @s remove cse.status_effect.sneaking_speed.data_target
tag @s remove cse.status_effect.sneaking_speed.user

tag @e[sort=arbitrary,tag=cse.status_effect.sneaking_speed.data_target,tag=cse.status_effect.sneaking_speed.data,distance=0..,type=marker] remove cse.status_effect.sneaking_speed.data_target