tag @s add cse.status_effect.jump_strength.data_target
tag @s add cse.status_effect.jump_strength.user

execute \
    as @e[tag=cse.status_effect.jump_strength.data,distance=0..,type=marker] \
    if score @s cse.status_effects.jump_strength.id = @n[tag=cse.status_effect.jump_strength.user,tag=cse.status_effect.jump_strength.data_target,distance=0..,type=!#cse:dummy_mob] cse.status_effects.jump_strength.id run \
tag @s add cse.status_effect.jump_strength.data_target

$execute \
    as @n[sort=arbitrary,tag=cse.status_effect.jump_strength.id.$(id),tag=cse.status_effect.jump_strength.$(type),tag=cse.status_effect.jump_strength.data_target,tag=cse.status_effect.jump_strength.data,distance=0..,type=marker] run \
function cse:status_effects/apply/jump_strength/marker_data/math {duration:$(duration),value:$(value), max:$(max)}

$attribute @s minecraft:jump_strength modifier remove cse.status_effects.jump_strength.$(id).$(type)
data modify storage cse:status_effects jump_strength.final_value.value set from entity @n[tag=cse.status_effect.jump_strength.data,tag=cse.status_effect.jump_strength.data_target,distance=0..,type=marker] data.cse.jump_strength.base_value
$data modify storage cse:status_effects jump_strength.final_value.type set value "$(type)"
$data modify storage cse:status_effects jump_strength.final_value.id set value "$(id)"
function cse:status_effects/apply/jump_strength/marker_data/merge with storage cse:status_effects jump_strength.final_value

data modify storage temp2 temp set from storage cse:status_effects jump_strength.final_value
data remove storage cse:status_effects jump_strength

tag @s remove cse.status_effect.jump_strength.data_target
tag @s remove cse.status_effect.jump_strength.user

tag @e[sort=arbitrary,tag=cse.status_effect.jump_strength.data_target,tag=cse.status_effect.jump_strength.data,distance=0..,type=marker] remove cse.status_effect.jump_strength.data_target